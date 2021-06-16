import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/Daily_challenges13.dart';
import 'package:katapult_screens/friends(72).dart';
import 'Leaderboard(57).dart';
import 'Library(74).dart';
import 'MainPage_11.dart';
import 'Marketplace.dart';
import 'constants.dart';
import 'forum_68.dart';
class Screen67 extends StatefulWidget {
  String username;
  @override
  _Screen67State createState() => _Screen67State();
  Screen67(this.username);
}
class _Screen67State extends State<Screen67> {
  bool selected = false;
  var userStatus = List<bool>();
  String url= 'http://3.139.74.186/challenges';
  List data;
  // ignore: missing_return
  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url));
    this.setState(() {
      Map<String, dynamic> extractdata = jsonDecode(response.body);
      data = extractdata["recordset"];
    });
  }
  @override
  // ignore: must_call_super
  void initState(){
    this.makeRequest();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        //backgroundColor: Color(0xff000877).withOpacity(0.80)  ,
        body:SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            //padding: EdgeInsets.all(8.0),
            child:Container(
              color: Color(0xff3A0080).withOpacity(0.77),
              padding: EdgeInsets.all(14.0),
              child: Column(
                  children: [
                    SizedBox(height: 10.0,),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Row(
                        children:[
                          Flexible(
                            child: Card(
                              color: Color(0xffAB75EB) ,
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
                                              Icons.arrow_back,size:12, color: Colors.white,)
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
                    SizedBox(height: 20.0,),
                    Text("Social Engagement",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,
                      fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                    SizedBox(height: 15.0,),
                    Flexible(
                      flex:7,
                      fit:FlexFit.tight,
                      child: Container(
                        height: 540,
                        width: 341,
                        child: Card(
                          color: Color(0xffAB75EB).withOpacity(0.40),
                          //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),
                          child: Center(

                            child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Container(
                                    height:126 ,
                                    width: 259,
                                    child: Card(
                                      color: Color(0xffD6E2FB).withOpacity(0.30),
                                      elevation: 10.0,
                                      //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular (10.0)
                                      ),
                                      child:InkWell(
                                        onTap: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              builder: (context) => Screen74()
                                          ));
                                        },

                                        child: new Container(
                                          padding: EdgeInsets.all(20.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children:[

                                                Image.network(Constant.base_url+"getPdfFile/Library"),
                                                Text("Library",style: TextStyle(color: Color(0xff3844BD),fontSize: 24,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),)


                                              ],
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Container(
                                    height:126 ,
                                    width: 259,
                                    child: Card(
                                        color: Color(0xffD6E2FB).withOpacity(0.30),
                                        elevation: 10.0,
                                        //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular (10.0)
                                        ),
                                        child:InkWell(
                                          onTap: (){
                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                builder: (context) => Screen68()

                                            ));
                                          },

                                          child: new Container(
                                            padding: EdgeInsets.all(20.0),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children:[
                                                  Image.network(Constant.base_url+"getPdfFile/Forum"),
                                                  Text("Forums",style: TextStyle(color: Color(0xff3844BD),fontSize: 24,
                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)



                                                ],
                                              ),

                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Container(
                                    height:126 ,
                                    width: 259,
                                    child: Card(
                                      color: Color(0xffD6E2FB).withOpacity(0.30),
                                      elevation: 10.0,
                                      //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular (10.0)
                                      ),
                                      child:InkWell(
                                        onTap: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              builder: (context) => Screen72()
                                          ));
                                        },

                                        child: new Container(
                                          padding: EdgeInsets.all(20.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children:[
                                                Image.network(Constant.base_url+"getPdfFile/Friends"),
                                                Text("Friends",style: TextStyle(color: Color(0xff3844BD),fontSize: 24,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)



                                              ],
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]
                            ),

                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        width:900,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[

                            Flexible(
                              flex:1,
                              fit:FlexFit.loose,
                              child: Container(
                                height: 48,
                                width: 100,
                                child: Card(
                                  color: Color(0xffFFFFFF) ,
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(5.0)
                                  ),
                                  //  margin: EdgeInsets.all(3.0),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) => Screen13(widget.username)
                                      ));
                                    },
                                    child: Center(
                                      child:  Image.network(
                                          Constant.base_url+"getPdfFile/Daily",
                                          fit: BoxFit.cover),
                                      // mainAxisAlignment: MainAxisAlignment.start,


                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              fit:FlexFit.loose,
                              child: Container(
                                height: 48,
                                width: 100,
                                child: Card(
                                  color: Color(0xff15B1F1) ,
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(5.0)
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) => Screen57(widget.username)
                                      ));
                                    },
                                    //margin: EdgeInsets.all(3.0),
                                    //margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                    child: Center(
                                      child: Container(

                                        // padding: EdgeInsets.all(18.0),
                                        child:Image.network(
                                            Constant.base_url+"getPdfFile/Group 74",fit: BoxFit.cover),
                                        // mainAxisAlignment: MainAxisAlignment.start,

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex:1,
                              fit:FlexFit.loose,
                              child: Container(
                                height: 48,
                                width: 100,
                                child: Card(
                                  color: Color(0xffFF6A56) ,
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(5.0)
                                  ),

                                  // margin: EdgeInsets.all(3.0),
                                  //    margin: EdgeInsets.only(top: 5.0, bottom: 4.0),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) => Screen67(widget.username)
                                      ));
                                    },
                                    child: Center(
                                      child: Image.network(
                                          Constant.base_url+"getPdfFile/Group 99",
                                          fit: BoxFit.cover),
                                      // mainAxisAlignment: MainAxisAlignment.start,

                                    ),

                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              fit:FlexFit.loose,
                              child: Container(
                                  height: 48,
                                  width: 100,
                                  child: Card(
                                    color: Color(0xff490092) ,
                                    //margin: EdgeInsets.only(right: 300,),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(5.0)
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (context) => Screen62(widget.username)
                                        ));
                                      },
                                      //margin: EdgeInsets.all(5),
                                      // margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                      child: Center(
                                        child:  Image.network(
                                            Constant.base_url+"getPdfFile/Group 100",
                                            fit: BoxFit.cover),
                                        // mainAxisAlignment: MainAxisAlignment.start,

                                      ),
                                    ),
                                  )
                              ),
                            ),


                          ],
                        ),
                      ),//Container
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
  void moveToLastScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Screen1(),
    ));
  }
}
