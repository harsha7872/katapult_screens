import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/MainPage_11.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

void main() { runApp(MyApp());}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Screen3(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Screen3 extends StatefulWidget {
  List<String> selectedList = [];
  int marks,expgain,chips,questionanswered,correct,fifty,multiplier;
  Screen3({Key key,@required this.marks,@required  this.expgain,
    @required  this.chips,@required this.questionanswered,@required this.selectedList,@required this.correct,@required this.fifty,@required this.multiplier}) : super(key: key);
  @override
  _Screen3State createState() => _Screen3State(this.marks,this.expgain,this.chips,this.questionanswered,this.selectedList,this.correct,this.fifty,this.multiplier);

}
class _Screen3State extends State<Screen3> {
  Object get height1 => MediaQuery.of(context).size.height;
  Object get width1 => MediaQuery.of(context).size.width;
  List leader;
  String Email;
  List rewards,leaders;
  List<String> selectedList = [];
  int marks,expgain,chips,questionanswered,correct,fifty,multiplier;
  _Screen3State(this.marks,this.expgain,this.chips,this.questionanswered,this.selectedList,this.correct,this.fifty,this.multiplier);
  // ignore: missing_return



  Future<String> makRequest() async{
    var token = await FlutterSession().get('token')  ;
    Email = token.toString();
    String url =Constant.base_url+"rewards/$Email";
    String prl =Constant.base_url+"leader";

    var response = await http.get(Uri.encodeFull(url));
    var respons = await http.get(Uri.encodeFull(prl));
    setState(() {
      Map<String, dynamic> extracdata = jsonDecode(response.body);
      rewards = extracdata["recordset"];
      Map<String, dynamic> extractdata = jsonDecode(respons.body);
      leaders = extractdata["recordset"];

    });
    print(rewards);
    print(leaders);
  }

  @override
  // ignore: must_call_super
  void initState(){
    makRequest();
    print(correct);
  }
  bool submitting = false;
  void toggleSubmitState() {
    setState(() {
      submitting = !submitting;
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        builder: (context, snapshot) {
          if(leaders== null){
            return  new Scaffold(
              body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bcImg.png"),
                        fit: BoxFit.cover)),
                child: Container(
                  color:  Color(0xffFF6A56).withOpacity(0.80),
                  child: new Center(
                    child: const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }
          else{
            print(fifty);
            return Screen33(leaders:leaders,rewards:rewards,marks:marks,chips:chips,expgain:expgain,questionanswered:questionanswered,selectedList:selectedList,correct:correct,fifty:fifty,multiplier:multiplier);

          }
        }
    );
  }
}
class Screen33 extends StatefulWidget {
  List rewards,leaders;
  List<String> selectedList = [];
  SharedPreferences logindata;
  String username;

  int marks,expgain,chips,questionanswered,correct,fifty,multiplier;
  Screen33({Key key,@required this.marks,@required  this.expgain,
    @required  this.chips,@required this.questionanswered,@required this.leaders,@required this.rewards,@required this.selectedList,@required this.correct,@required this.fifty,@required this.multiplier}) : super(key: key);
  @override
  _Screen33State createState() => new _Screen33State(marks,expgain,chips,questionanswered,leaders,rewards,correct,fifty,multiplier);
}

class _Screen33State extends State<Screen33> {
  Object get height1 => MediaQuery.of(context).size.height;
  Object get width1 => MediaQuery.of(context).size.width;
  List rewards,leaders;
  String message;
  int correct,fifty,multiplier;
  SharedPreferences logindata;
  String username;
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }
  List leader;
  String dart;
  Future<String> leaderBoard() async{
    var token = await FlutterSession().get('token')  ;
    dart = token.toString();
    String url =Constant.base_url+"leader";
    // String prl =Constant.base_url+"rewards/$dart";

    // var respons = await http.get(Uri.encodeFull(prl));
    var response = await http.get(Uri.encodeFull(url));
    setState(() {
      Map<String, dynamic> extracdata = jsonDecode(response.body);
      leader = extracdata["recordset"];
    });
    print(leader);

  }

  void initState(){
    // userLifeline(dart, correct.toString(),fifty.toString(),multiplier.toString());
    leaderBoard();


  }
  Future<void> userReward(String email, String userChips ) async {
    final response = await http.post(Constant.base_url+'userReward', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': email,
      'userChips': userChips,

    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        //return Navigator.pushReplacement(context, MaterialPageRoute(
        //  builder: (context) =>Screen1()));
      }
      else if(response.statusCode == 402) {
        print(response.body);
        // displayDialog(context, "Email is already registered","Log in if you already have an account.");
      }
      else  {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }


    } catch (e) {
      print(e.message);
    }
  }
  Future<void> userLifeline(String dart, String correct,String fifty,String multiplier) async {
    print(correct);
    print(fifty);
    final response =
    await http.post(Constant.base_url+"userLife", headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': dart,
      'CORRECT': correct,
      'FIFTY50' : fifty,
      'MULTIPLIER':multiplier
    });
    try {
      if (response.statusCode == 201) {
        print(response.body);
        return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>Screen1()));
      }
      else  {
        print(response.body);
      }
    } catch (e) {
      print(e.message);
    }
  }
  @override

  int marks,expgain,chips,questionanswered;
  _Screen33State(this.marks,this.expgain,this.chips,this.questionanswered, this.leaders,this.rewards, this.correct,this.fifty,this.multiplier);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: new Scaffold(
        body:SingleChildScrollView(
            child: Container(
                height:height1,
                width:screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bcImg.png'),
                        fit: BoxFit.cover)),
                child:  Container(
                  color: Color(0xffFF6A56).withOpacity(0.80),
                  padding: EdgeInsets.all(10.0),
                  child:Column(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5.0,),
                        //card is used to naviagte to home screen
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
                                      // padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: GestureDetector(
                                                onTap: () {
                                                  print(fifty);
                                                  userLifeline(dart,correct.toString(),fifty.toString(),multiplier.toString());
                                                },
                                                child: Icon(
                                                    Icons.arrow_back, color: Colors.white,size:12)
                                            ),
                                          ),
                                          SizedBox(width:5.0),
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
                        Flexible(
                          flex:6,
                          fit: FlexFit.tight,
                          child: Container(

                            child: Card(
                              color: Color(0xffEFAEB1).withOpacity(0.60),
                              //  margin: EdgeInsets.only(top: 30.0,right: 25.0,left: 25.0),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0)
                              ),
                              child: Center(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Container(

                                                child: Card(
                                                  color: Color(0xff3644BA).withOpacity(0.60),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(8),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(10.0)
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 17,
                                                    height: 17,
                                                    child: Text(
                                                      "K",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontWeight: FontWeight.w700,fontFamily: 'Montserrat'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(rewards[0]["userChips"].toString(),style: TextStyle(color: Color(0xff3644BA),fontSize: 12,fontWeight: FontWeight.w700,fontFamily: 'Montserrat'),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      /* height: 170,
                                      width: 321,*/
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: widget.selectedList.length,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // margin: EdgeInsets.only(top: 10.0),
                                                  child: Column(
                                                    crossAxisAlignment:CrossAxisAlignment.center,
                                                    children: [
                                                      Text(widget.selectedList[index], style:
                                                      TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Color(0xffFFFFFF),fontSize: 24,),),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 10.0),
                                      child: Divider(thickness: 2,),
                                    ),
                                    SizedBox(height: 5,),
                                    //user profile picture
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child:
                                      Container(
                                        alignment: Alignment.topCenter,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  width: 56,
                                                  height: 56,
                                                  padding: EdgeInsets.only(top: 20.0),

                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image:DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(Constant.base_url+'getPdfFile/Ellipse 2'),
                                                      )

                                                  ),

                                                )
                                              ],
                                            ),
                                            Column(children:[ Text("Your Score Card",style: TextStyle(color: Color(0xff04D9F8),fontSize: 21,fontWeight: FontWeight.w700,fontFamily: 'Montserrat'),),
                                              Text("Total Questions Answered : $questionanswered",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                                            ]),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment. spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Card(
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(50.0),
                                                        side: BorderSide(color: Color(0xffC10B0B))
                                                    ),

                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      width: 35,
                                                      height: 35,
                                                      child: Text(
                                                        "$marks",style: TextStyle(color: Color(0xffC10B0B),fontSize: 10,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  ),
                                                  Text("Total Score",style: TextStyle(fontSize: 10.0,color: Color(0xffC10B0B),fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Card(
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(50.0),
                                                        side: BorderSide(color: Color(0xff3644BA))
                                                    ),

                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      width: 35,
                                                      height: 35,
                                                      child: Text(
                                                        "$chips",style: TextStyle(color: Color(0xff3644BA),fontSize: 10,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  ),
                                                  Text("Chips Earned",style: TextStyle(fontSize: 10.0,color: Color(0xff3644BA),fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Card(
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(50.0),
                                                        side: BorderSide(color: Color(0xffB71570))
                                                    ),

                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      width: 35,
                                                      height: 35,
                                                      child: Text(
                                                        "$expgain",style: TextStyle(color: Color(0xffB71570),fontSize: 10,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),
                                                      ),
                                                    ),
                                                  ),
                                                  Text("Exp. Gained",style: TextStyle(fontSize: 10.0,color: Color(0xffB71570),fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                                                ],
                                              ),
                                            ],
                                          ),
                                          //  SizedBox(height: 5.0,),
                                        ]
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex:7,
                          fit: FlexFit.tight,
                          child: Container(
                            //   height: (339/SizeConfig.heightMultiplier)*SizeConfig.heightMultiplier,
                            // width:(341/SizeConfig.widthMultiplier)*SizeConfig.widthMultiplier,height: ,
                            child: SingleChildScrollView(
                              child: Card(
                                color: Color(0xffF4B658).withOpacity(0.50),
                                // margin: EdgeInsets.only(top: 10.0,right: 25.0,left: 25.0),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)
                                ),
                                child: Center(

                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child:
                                          Container(
                                            padding: EdgeInsets.all(15.0),
                                            alignment: Alignment.topCenter,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text("Leaderboard",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),)
                                                  ],
                                                ),
                                                Column(children:[
                                                  Card(
                                                    color: Color(0xffDB6C3E),
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(10.0),
                                                        side: BorderSide(color: Color(0xffECA77E))
                                                    ),
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      width: 55,
                                                      height: 18,
                                                      child: Text(
                                                        "View Full Details",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 5,fontWeight: FontWeight.w600),
                                                      ),
                                                    ),
                                                  )
                                                ]),

                                              ],
                                            ),

                                          ),
                                        ),
                                        Card(
                                          color: Color(0xffECA77E),
                                          //margin: EdgeInsets.all(30.0),
                                          margin: EdgeInsets.only(left: 15,right: 15),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(5.0),
                                              side: BorderSide(color: Color(0xffDB6C3E))
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: 300,
                                              height: 30,
                                              padding: EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [

                                                  Text("Category: History", style: TextStyle(color: Color(0xffDB6C3E),
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                                  IconButton(
                                                    icon: Icon(Icons.keyboard_arrow_down,color: Color(0xffDB6C3E),size: 12,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        DefaultTabController(
                                          length: 3,
                                          child: Container(

                                            color: Color(0xffECA77E),
                                            width: 300,
                                            height: 30,
                                            child: TabBar(
                                                unselectedLabelColor: Color(0xffDB6C3E),
                                                indicator: BoxDecoration(
                                                  // borderRadius: BorderRadius.circular(10),
                                                  color: Color(0xffDB6C3E),
                                                ),
                                                tabs: [
                                                  Tab(child: Text("Daily",style: TextStyle(color: Color(0xffFFFFFF),
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),),
                                                  Tab(child:Text("Weekly",style: TextStyle(color: Color(0xffDB6C3E),
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),),
                                                  Tab(child:Text( "Overall",style: TextStyle(color: Color(0xffDB6C3E),
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),),
                                                ]),

                                          ),

                                        ),
                                        SizedBox(height: 10,),
                                        Column(
                                          children: [
                                            Text("Daily Leaderboard", style: TextStyle(color: Color(0xff000000),
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 14),),
                                            SizedBox(height: 10.0,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                        width: 35,
                                                        height: 15,
                                                        child: Text("Rank",style: TextStyle(color: Color(0xff000000),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 10),)),
                                                  ],),
                                                Column(
                                                  children: [
                                                    Container(
                                                        width: 35,
                                                        height: 10,
                                                        child: Text("Name",style: TextStyle(color: Color(0xff000000),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 10),)),
                                                  ],),
                                                Column(
                                                  children: [
                                                    Container(
                                                        child: Text("High Score",style: TextStyle(color: Color(0xff000000),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 10),)
                                                    ),

                                                  ],),
                                              ],
                                            ),
                                            SizedBox(height: 10.0,),

                                            ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount:leaders.length,
                                              itemBuilder: (BuildContext context, int index) {

                                                return SingleChildScrollView(

                                                  child: new Container(
                                                    padding: EdgeInsets.only(right: 9.0),
                                                    child: new Center(
                                                      child: new  Row(
                                                        mainAxisAlignment: MainAxisAlignment. spaceEvenly,
                                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [

                                                              Container(
                                                                  width: 35,
                                                                  height: 15,
                                                                  //padding:EdgeInsets.all(5.0),
                                                                  child: Text(leaders[index]["userIds"],style: TextStyle(color: Color(0xff000000),
                                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 10),)),
                                                            ],),
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    width: 17,
                                                                    height: 17,
                                                                    padding: EdgeInsets.only(left: 30.0),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        image:DecorationImage(
                                                                          fit: BoxFit.fill,
                                                                          image: NetworkImage(Constant.base_url+'getPdfFile/Emma'),
                                                                        )

                                                                    ),


                                                                  ),
                                                                  Container(
                                                                      width: 35,
                                                                      height: 10,
                                                                      child: Text(leaders[index]["firstName"],style: TextStyle(color: Color(0xff000000),
                                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 10),)),
                                                                ],
                                                              )

                                                            ],),
                                                          //Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                                          Column(
                                                            children: [
                                                              Container(
                                                                  padding:EdgeInsets.all(5.0),
                                                                  child: Text(leaders[index]["userChips"].toString(),style: TextStyle(color: Color(0xff000000),
                                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 10),)),

                                                            ],),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),

                                          ],
                                        ),
                                        SizedBox(height: 40,),

                                      ],
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                )
            )
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