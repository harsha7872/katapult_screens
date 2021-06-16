import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/User.dart';
import 'package:katapult_screens/screen_19.dart';
import 'package:katapult_screens/screen_23.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'MainPage_11.dart';
import 'constants.dart';

class Screen18 extends StatefulWidget {
  String username;
  String name1;
  int correct,fifty,multiplier;
  @override
  _Screen18State createState() => _Screen18State();
  Screen18(this.username,this.name1,this.correct,this.fifty,this.multiplier);
}
class _Screen18State extends State<Screen18> {
  String requestmode;
  List<String> requestcategory= [];
  Object get height1 => MediaQuery.of(context).size.height;
  Object get width1 => MediaQuery.of(context).size.width;
  bool selected = false;
  var userStatus = List<bool>();
  SharedPreferences logindata;
  // String username;
  @override
  void initState() {
    this._getUsers();
    super.initState();
    // initial();
  }

  // void initial() async {
  //   logindata = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = logindata.getString('username');
  //   });
  // }
  Future<List<User>> _getUsers() async {

    var data = await http
        .get(Constant.base_url);
    var jsonData = json.decode(data.body);
    var fetch = jsonData["recordset"];
    List<User> users = [];
    for (var u in fetch) {
      User user =
      User(u["id"],u["parent_id"], u["category"], u["color"],u["isChecked"],);
      users.add(user);
      userStatus.add(false);
    }
    print(users.length);
   return users;
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
          body:SingleChildScrollView(
            child: Container(
              height:height1,
                width:screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                        fit: BoxFit.cover)),
                child: Container(
                    color: Color(0xffBB138A).withOpacity(0.80),
                  padding: const EdgeInsets.all(10.0),
                    child: Column(
                       // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5.0,),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topRight ,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                        image: NetworkImage(Constant.base_url+"getPdfFile/anand"),
                                                      )

                                                  ),

                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Hi ${widget.username},", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,
                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                SizedBox(height:5.0),
                                                Text("Its time to play!",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
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
                                  ],
                                ),
                              ),//Container
                            ),
                            SizedBox(height: 5.0,),

                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Row(
                                children:[
                                  Flexible(
                                    child: Card(
                                      color: Color(0xff3644BA),
                                      //margin: EdgeInsets.all(30.0),
                                      // margin: EdgeInsets.only(right: 250, top: 10.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(10.0)
                                      ),
                                      child: Center(
                                        child: Container(
                                          padding: EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Flexible(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) => Screen1()
                                                          ));
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_back, size:12,color: Colors.white,)
                                                ),
                                              ),
                                              Flexible(
                                                child: GestureDetector(
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons.home, color: Colors.white,)),
                                              )
                                            ],
                                          ),


                                          // mainAxisAlignment: MainAxisAlignment.start,

                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      flex:3,
                                      fit:FlexFit.tight,
                                      child:Container(

                                      )
                                  )
                                ],
                              ),
                            ),

                           // SizedBox(height: 5.0,),
                            Flexible(
                              flex:10,
                              child: Container(
                              //  height: (638/SizeConfig.heightMultiplier)*SizeConfig.heightMultiplier,
                               // width:(341/SizeConfig.widthMultiplier)*SizeConfig.widthMultiplier,
                                child: Card(
                                  color: Color(0xffF17EDC).withOpacity(0.40),
                               //   margin: EdgeInsets.all(20.0),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0)
                                  ),
                                  child:  SingleChildScrollView(
                                    child: Container(


                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height:
                                          5,),
                                          Container(
                                            child: Text("Single Player",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                          ),
                                          Text("\n You can choose up to 3 different topics/sub-topics",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                          FutureBuilder(
                                            future: _getUsers(),
                                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                                              print(snapshot.data);
                                              if (snapshot.data == null) {
                                                return Container(child: Center(child: Text("Loading...")));
                                              } else {
                                                return GridView.builder(
                                                  scrollDirection: Axis.vertical,
                                                  shrinkWrap: true,
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 15),
                                                  itemCount: snapshot.data.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return  new Container(
                                                        child: new Center(
                                                          child: new Column(
                                                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                              Container(
                                                                //padding: EdgeInsets.only(top: 1.0.h,left: 0.5.h,right: 0.5.h),
                                                                child: Card(
                                                                  shape: new RoundedRectangleBorder(
                                                                      borderRadius: new BorderRadius.circular(5.0)
                                                                  ),
                                                                  child: InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                        builder: (context) => Screen19(snapshot.data[index],widget.username,widget.name1,widget.correct,widget.fifty,widget.multiplier),
                                                                      ));
                                                                    },
                                                                    child: new Container(
                                                                      height: 7.0.h,
                                                                      width: 13.5.w,
                                                                        child:Image.network(Constant.base_url+'getPdfFile/${snapshot.data[index].category}'),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              Text(snapshot.data[index].category,

                                                                style: TextStyle(fontSize: 8,
                                                                    color: Color(0xffFFFFFF)),
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

                                ),
                              ),
                            ),
                          ]
                      ),

                )

            ),
          )
      ),
    );
  }
  void moveToLastScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Screen1(),
    ));
  }
}

/*class DetailPage extends StatelessWidget {
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
            child: Text("back to ${user.category}".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',color: Colors.white,fontSize: 12, fontWeight: FontWeight.bold),),
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
}*/









