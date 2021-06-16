import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:katapult_screens/User.dart';
import 'package:katapult_screens/screen_8.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
class MyHomePage extends StatefulWidget {
  String username;
  @override
  _MyHomePageState createState() => _MyHomePageState();
  MyHomePage(this.username);
}

class _MyHomePageState extends State<MyHomePage> {

  bool selected = false;
  var userStatus = List<bool>();
  SharedPreferences logindata;
  String username;
  @override
  void initState() {
    this._getUsers();
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }
  Future<List<User>> _getUsers() async {

    var data = await http
        .get(Constant.base_url);

    var jsonData = json.decode(data.body);
    var fetch = jsonData["recordset"];

    List<User> users = [];

    for (var u in fetch) {
      User user =
      User(u["id"],u["parent_id"], u["category"], u["picture"],u["isChecked"],);

      users.add(user);
      userStatus.add(false);
    }

    print(users.length);

    return users;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                      fit: BoxFit.cover)),
              child: Container(
                  color: Color(0xff13BBAA).withOpacity(0.80),
                  child: Container(
                    //margin: EdgeInsets.only(left:10.0,right:10.0,bottom:110.0,top:10.0),
                    child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight ,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image:DecorationImage(
                                              fit: BoxFit.fill,

                                              image: NetworkImage(
                                                  Constant.base_url+"getPdfFile/anand"),
                                            )

                                        ),

                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("  Hi ${widget.username},", style: TextStyle(color: Color(0xffFFFFFF),
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 18),),
                                      SizedBox(height:5.0),
                                      Text("  Its time to play!",style: TextStyle(color: Color(0xffFFFFFF),
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 10),),
                                    ],
                                  ),
                                  SizedBox(width:100.0),
                                  Column(
                                    children: [
                                      Image.network(Constant.base_url+"getPdfFile/Message")
                                    ],
                                  ),
                                  SizedBox(width:0.0),
                                  Column(
                                    children: [
                                      Image.network(Constant.base_url+"getPdfFile/Search")
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0,),

                          Padding(
                            padding: const EdgeInsets.only(left:20.0,right: 20,top: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment. spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Card(
                                      color: Color(0xff3644BA),
                                      //margin: EdgeInsets.all(30.0),
                                      // margin: EdgeInsets.only(right: 270,top: 10.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(10.0)
                                      ),
                                      child: Center(
                                        child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            children:<Widget> [
                                              Row(
                                                children: [
                                                  Icon(Icons.arrow_back ,size:12,color: Colors.white,),
                                                  Icon(Icons.home,color: Colors.white,)
                                                ],
                                              ),
                                            ],
                                          ),
                                          // mainAxisAlignment: MainAxisAlignment.start,

                                        ),
                                      ),
                                    ),
                                  ],),
                                Column(
                                  children: [
                                    Container(
                                      height: 53,
                                      width: 152,
                                      child: RaisedButton(
                                        color: Color(0xff0A6E75),
                                        textColor: Color(0xffFFFFFF),
                                        //padding: const EdgeInsets.only(left: 35,right: 34,top: 17,bottom: 17),
                                        child: Text("proceed".toUpperCase(),style: TextStyle( fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)),
                                      ),
                                    ),


                                  ],),

                              ],
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Container(
                            height: 638,
                            width: 341,
                            child: Card(
                              color: Color(0xff99CFD6).withOpacity(0.40),
                              margin: EdgeInsets.all(20.0),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0)
                              ),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height:
                                  20,),
                                  Container(
                                    child: Text("Multiplayer Player",style: TextStyle(color: Color(0xffFFFFFF),
                                        fontSize: 24, fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                                  ),
                                  Text("\n You can choose up to 3 different topics/sub-topics",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10, fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                  FutureBuilder(
                                    future: _getUsers(),
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                                      print(snapshot.data);
                                      if (snapshot.data == null) {
                                        return Container(child: Center(child: Text("")));
                                      } else {
                                        return GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 30),
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return new Container(
                                              child: new Center(
                                                child: new Column(
                                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 12.0,left: 12.0,right: 12.0),
                                                      child: Card(
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                              builder: (context) => Screen8(snapshot.data[index],),
                                                            ));
                                                          },
                                                          child: new Container(
                                                            height: 40,
                                                            width: 40,
                                                            child:Image.network('http://3.15.230.33/user/getPdfFile/${snapshot.data[index].category}'),
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    Text(snapshot.data[index].category,

                                                      style: TextStyle(fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),

                            ),
                          ),
                        ]
                    ),
                  )
              )

          ),
        )
    );
  }

}

class DetailPage extends StatelessWidget {
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.id.toString()),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Color(0xff3644BA),
            textColor: Colors.white,
            padding: const EdgeInsets.only(left: 35,right: 34,top: 17,bottom: 17),
            child: Text("back to ${user.category}".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12, ),),
            onPressed: (){
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
                // builder: (context) => MyHomePage(),
              // ));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}









