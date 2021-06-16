import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'MainPage_11.dart';
import 'User.dart';
import 'categorypage(7).dart';
import 'constants.dart';


class Screen16 extends StatefulWidget {
  @override
  _Screen16State createState() => _Screen16State();
}

class _Screen16State extends State<Screen16> {

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
                height: 812,
                width: 375,
                color: Color(0xff3555C9).withOpacity(0.80),
                child:Container(
               margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                     Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Card(
                                color: Color(0xff3644BA) ,
                                //margin: EdgeInsets.all(30.0),
                               // margin: EdgeInsets.only(right: 250,top: 10.0),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Container(
                                    height:53 ,
                                    width: 82,
                                    // padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.arrow_back,color: Colors.white,),
                                              onPressed: () {
                                                 Navigator.of(context).pushReplacement(MaterialPageRoute(
                                               builder: (context) => Screen1()
                                                ));
                                              },
                                            ),

                                            Icon(Icons.home,color: Colors.white,)
                                          ],
                                        ),
                                      ],
                                    ),
                                    // mainAxisAlignment: MainAxisAlignment.start,

                                  ),
                                ),
                              ),
                                 SizedBox(width: 170,),
                              Column(
                                children: [
                                  GestureDetector(
                                      onTap: (){},
                                      child: Image.network(Constant.base_url+"getPdfFile/Message"))
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
                      Container(
                     height: 656,
                     width: 341,
                     //margin: EdgeInsets.only(top: 91.0,bottom: 65.0,right: 17.0,left: 17.0),
                      child: Card(
                        color: Color(0xff5095E4).withOpacity(0.40),
                          margin: EdgeInsets.all(8.0),
                         shape: new RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Row(
                               //mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                     Align(
                                      // alignment: Alignment.topRight,
                                       child: Container(
                                           height:18.85 ,
                                           width:14.66 ,
                                           padding: EdgeInsets.only(top:10.0,left:280.0,right: 20),
                                           child: Icon(Icons.delete_forever,color: Color(0xffF5B654),)),
                                     ),
                                   ],

                                 )
                               ],
                             ),
                             Row(
                               mainAxisAlignment:MainAxisAlignment.center,

                               children: [
                                 Column(
                                   children:[
                                     Padding(

                                       padding: EdgeInsets.all(8.0),
                                       child: Text("Favourites",style: TextStyle(color: Colors.white,fontSize: 18,
                                           fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                     ),
                                   ]

                                 ),

                               ],
                             ),

                          Text("Click and hold to remove",style: TextStyle(color: Colors.white,fontSize: 10,
                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
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
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 20),
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
                                                //Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                  //builder: (context) => Screen8(snapshot.data[index],),
                                                //));
                                              },
                                              child: new Container(
                                                height: 40,
                                                width: 40,
                                                child:Image.network(Constant.base_url+'getPdfFile/${snapshot.data[index].category}'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(snapshot.data[index].category,

                                          style: TextStyle(fontSize: 8,color: Colors.white),
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
                     // SizedBox(height: 10.0,),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment. spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                // height:50,
                                //width:90,
                                child: Card(

                                  // color: Colors.blueAccent ,
                                  //margin: EdgeInsets.only(right: 300,),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(5.0)
                                    ),
                                    child:InkWell(
                                      onTap: (){
                                        //Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        //builder: (context) => Screen13()
                                        //));
                                      },
                                      //  margin: EdgeInsets.all(3.0),
                                      child: Center(
                                        child: Container(
                                          height: 50,
                                          width: 80,
                                          padding: EdgeInsets.only(
                                              left: 20.0, top: 5.0, right: 20.0, bottom: 4.0),
                                          child: //Image.asset("assets/Daily.png")
                                          Image.network('http://18.221.172.251/getPdfFile/Daily',fit: BoxFit.cover),
                                          // mainAxisAlignment: MainAxisAlignment.start,

                                        ),
                                      ),
                                    )
                                ),
                              ),


                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                //height:50,
                                //width:90,
                                child: Card(
                                  // color: Colors.blueAccent ,
                                  //margin: EdgeInsets.only(right: 300,),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0)
                                    ),
                                    child:InkWell(
                                      onTap: (){
                                        //Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        //  builder: (context) => Screen57()
                                        //));
                                      },
                                      //margin: EdgeInsets.all(3.0),
                                      //margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                      child: Center(
                                        child: Container(
                                          height: 50,
                                          width: 80,
                                          // padding: EdgeInsets.all(18.0),
                                          child://Image.asset("assets/Group 74.png")
                                          Image.network('http://18.221.172.251/getPdfFile/Group 74',fit: BoxFit.cover),
                                          // mainAxisAlignment: MainAxisAlignment.start,

                                        ),
                                      ),
                                    )
                                ),
                              ),


                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                //height:50,
                                //width:90,
                                child: Card(

                                  // color: Colors.blueAccent ,
                                  //margin: EdgeInsets.only(right: 300,),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0)
                                    ),
                                    margin: EdgeInsets.only(top: 5.0, bottom: 4.0),
                                    child:InkWell(
                                      onTap: (){
                                        //Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        //  builder: (context) => Screen67()
                                        //));
                                      },
                                      // margin: EdgeInsets.all(3.0),

                                      child: Center(
                                        child: Container(
                                          height: 50,
                                          width: 80,
                                          // padding: EdgeInsets.all(18.0),
                                          child://Image.asset("assets/Group 99.png")
                                          Image.network('http://18.221.172.251/getPdfFile/Group 99',fit: BoxFit.cover),
                                          // mainAxisAlignment: MainAxisAlignment.start,

                                        ),
                                      ),
                                    )
                                ),
                              ),


                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                //height:60,
                                //width:90,
                                child: Card(
                                  // color: Colors.blueAccent ,
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(15.0)
                                  ),
                                  child:InkWell(
                                    onTap: (){
                                      //Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      //  builder: (context) => Screen62()
                                      //));
                                    },
                                    //margin: EdgeInsets.all(5),
                                    // margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                    child: Center(
                                      child: Container(
                                        height: 50,
                                        width: 80,
                                        // padding: EdgeInsets.all(18.0),
                                        child: //Image.asset("assets/Group 100.png")
                                        Image.network('http://18.221.172.251/getPdfFile/Group 100',fit: BoxFit.cover),
                                        // mainAxisAlignment: MainAxisAlignment.start,

                                      ),
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),


                        ],
                      ),

                    ],
            ),
    ),

          )
        ),

        ),
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
            child: Text("back to ${user.category}".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Colors.white,fontSize: 12,),),
            onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ),

      ),


    );
  }
}









