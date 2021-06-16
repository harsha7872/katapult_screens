import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:katapult_screens/MainPage_11.dart';
import 'Daily_challenges13.dart';
import 'Leaderboard(57).dart';
import 'Marketplace.dart';
import 'Screen14_Notifications.dart';
import 'Social(67).dart';
import 'constants.dart';

class Screen15 extends StatefulWidget {
  String username,email;
  int correct,fifty,multiplier;
  int QuestionsAnswered,FriendsWith,MatchesPlayed;
  @override
  _Screen15State createState() => _Screen15State();
  Screen15(this.username,this.email,this.correct,this.fifty,this.multiplier,this.QuestionsAnswered,this.FriendsWith,this.MatchesPlayed);
}

class _Screen15State extends State<Screen15> {
  String email;
  List rewards;
  List userDetails;
  int correct,fifty,multiplier;
  int QuestionsAnswered,FriendsWith,MatchesPlayed;


  Future<String> makRequest() async{


    String url =Constant.base_url+"rewards/$email";
    String prl =Constant.base_url+"Name/$email";

    var respons = await http.get(Uri.encodeFull(prl));
    var response = await http.get(Uri.encodeFull(url));
    setState(() {
      Map<String, dynamic> extractdata = jsonDecode(respons.body);
      userDetails = extractdata["recordset"];
      Map<String, dynamic> extracdata = jsonDecode(response.body);
      rewards = extracdata["recordset"];
    });

    print(rewards);
    print(userDetails);
  }


  int counter = 0;
  @override

  // ignore: must_call_super
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child:Container(
            color: Color(0xff000877).withOpacity(0.80),
            padding: EdgeInsets.all(10.0),
            child: Column(
                children: [
                  Flexible(

                    child: Row(
                      children:[
                        Flexible(
                          flex:2 ,
                          fit: FlexFit.loose,
                          child: Card(
                            color: Color(0xffAB75EB),


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
                        ),
                        Flexible(
                            flex:3,
                            fit:FlexFit.tight,
                            child: Container(
                              child:
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,

                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                             /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                  builder: (context) => Screen14(userDetails[0]["firstName"])
                                              ));*//*
                                              setState(() {
                                                counter = 0;
                                              });*/
                                            },
                                            child: new Stack(
                                              children: <Widget>[
                                                new Image.network(Constant.base_url+"getPdfFile/Message",height: 21,),
                                                counter != 0 ? new Positioned(
                                                  left: 21,
                                                  bottom: 10,
                                                  child: new Container(
                                                    padding: EdgeInsets.all(1),
                                                    decoration: new BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius: BorderRadius.circular(6),
                                                    ),
                                                    constraints: BoxConstraints(
                                                      minWidth: 12,
                                                      minHeight: 12,
                                                    ),
                                                    child: Text(
                                                      '$counter',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 8,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ) : new Container()
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10.0),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,

                                        children: [
                                          Image.network(Constant.base_url +
                                              "getPdfFile/Search")
                                        ],
                                      )
                                    ],
                                  )

                                ],
                              ),

                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Flexible(
                    flex:11,
                    fit:FlexFit.tight,
                    child: Container(
                     /* height: 630,
                      width: 341,*/

                      child: Card(
                        color: Color(0xff36A3BA).withOpacity(0.40),
                        //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Center(

                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight ,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                               // height: 75,
                                               //width: 75,
                                               child: Center(
                                          child:Stack(
                                          children: [
                                            CircleAvatar(
                                             radius:30.0,
                                            backgroundImage: NetworkImage(Constant.base_url+"getPdfFile/anand"),
                                          ),
                                            Positioned(
                                             // bottom: 5.0,
                                              top:35.0,
                                                left: 35,
                                                //right:1.0,
                                                child: Icon(Icons.camera_alt,color: Color(0xffFFFFFF),size: 28.0,))
                                      ],
                                      )
                                      )
                                                //  padding: EdgeInsets.only(top: 10.0,),


                                              )
                                            ],
                                          ),
                                          SizedBox(width:10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  height:45,
                                                  width:150,
                                                  child: Text("${widget.username}", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 20,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)),
                                          SizedBox(height:10),
                                              Text("Beginner \n Level 2!",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                            ],
                                          ),
                                         // SizedBox(width:80),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.edit,color: Color(0xffFFFFFF),),
                                              SizedBox(height:10),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Image.network(Constant.base_url+"getPdfFile/india"),
                                                    Text("India",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  ),
                                  SizedBox(height:10),
                                  Card(
                                    color:Color(0xff6F79CC),
                                    //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        side: BorderSide(color:Color(0xff3644BA))
                                    ),

                                    child: Center(
                                      child: Column(
                                          children: [
                                            Container(
                                              height: 42,
                                              width: 300,
                                              // margin: EdgeInsets.only(:2.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(
                                                    padding:EdgeInsets.all(5.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Stack(
                                                                alignment: Alignment.center,
                                                                children: <Widget>[
                                                                  Image.network(Constant.base_url+"getPdfFile/eclipse"),
                                                                  Text("K",style: TextStyle(color: Color(0xff3644BA),fontSize: 12,fontWeight: FontWeight.w700,fontFamily: 'Montserrat')),
                                                                ]
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("  0 ", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                                Text("  Chips", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                              ],
                                                            )],
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width:5.0),
                                                  Padding(
                                                    padding: EdgeInsets.only(top:1.0,bottom: 1.0),
                                                    child: VerticalDivider(thickness: 1.0,color: Color(0xff3644BA),),
                                                  ),
                                                  // SizedBox(width:10.0),
                                                  Container(
                                                    padding:EdgeInsets.all(5.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            new Icon(Icons.bolt, color: Color(0xffFFFFFF),),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("  0 ", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                                Text("  Experience", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                              ],
                                                            )

                                                          ],

                                                        ),

                                                        //Text("  Experience",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top:1.0,bottom: 1.0),
                                                    child: VerticalDivider(thickness: 1.0,color: Color(0xff3644BA),),
                                                  ),
                                                  Container(
                                                    padding:EdgeInsets.all(5.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            new Icon(Icons.mail, color: Color(0xffFFFFFF),),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("  0 ", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                                Text("  Total Wins", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                              ],
                                                            ) ],
                                                        ),

                                                        // Text("  Total Wins",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),








                                            ),

                                          ]
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Card(
                                    color:Color(0xff6F79CC),
                                    //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        side: BorderSide(color:Color(0xff3644BA))
                                    ),
                                    child: Center(
                                      child: Column(
                                          children: [
                                            Container(
                                              height: 42,
                                              width: 300,
                                              // margin: EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(
                                                    padding:EdgeInsets.all(10.0),
                                                    child: Column(
                                                      ///mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Text("${widget.QuestionsAnswered}", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                        Text(" Questions Answered", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top:1.0,bottom: 1.0),
                                                    child: VerticalDivider(thickness: 1.0,color: Color(0xff3644BA),),
                                                  ),
                                                  Container(
                                                    padding:EdgeInsets.all(10.0),
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text("${widget.FriendsWith}", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                            Text("Friends With", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),



                                                          ],

                                                        ),

                                                        //Text("  Experience",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top:0.0,bottom: 0.0),
                                                    child: VerticalDivider(thickness: 1.0,color: Color(0xff3644BA),),
                                                  ),
                                                  Container(
                                                    padding:EdgeInsets.all(10.0),
                                                    child: Column(
                                                      children: [

                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("${widget.MatchesPlayed}", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                            Text("Matches Played", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                          ],
                                                        ) ],

                                                    ),
                                                  ),
                                                ],
                                              ),








                                            ),

                                          ]
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left:7.0,right: 7.0),
                                    child: Divider(thickness: 1.0,color: Color(0xff36A3BA),),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // width: 134,
                                            //height: 15,
                                              padding: EdgeInsets.all(5.0),
                                              child: Text("View All Fiends",style: TextStyle(fontSize: 12.0,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                        ],),
                                      Column(
                                        children: [
                                          Card(
                                            elevation: 2,
                                            shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(50.0),
                                              side: BorderSide( color: Color(0xff0D3B9B)),
                                            ),
                                            child: InkWell(
                                              onTap:(){
                                                //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                //));

                                              },
                                              child:Container(
                                                  height: 19,
                                                  width: 19,
                                                  child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                              ),
                                            ),
                                          ),
                                        ],
                                      )


                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left:7.0,right: 7.0),
                                    child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // width: 134,
                                            //height: 10,
                                              padding: EdgeInsets.all(5.0),
                                              child: Text("View Forums",style: TextStyle(fontSize: 12.0,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                        ],),
                                      Column(
                                        children: [
                                          Card(
                                            elevation: 2,
                                            shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(50.0),
                                              side: BorderSide( color: Color(0xff0D3B9B)),
                                            ),
                                            child: InkWell(
                                              onTap:(){
                                                //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                //));

                                              },
                                              child:Container(
                                                  height: 19,
                                                  width: 19,
                                                  child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                              ),
                                            ),
                                          ),
                                        ],
                                      )


                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left:7.0,right: 7.0),
                                    child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // width: 134,
                                            //height: 10,
                                              padding: EdgeInsets.all(5.0),
                                              child: Text("View All Favourite Topics/Subtopics",style: TextStyle(fontSize: 12.0,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                        ],),
                                      Column(
                                        children: [
                                          Card(
                                            elevation: 2,
                                            shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(50.0),
                                              side: BorderSide( color: Color(0xff0D3B9B)),
                                            ),
                                            child: InkWell(
                                              onTap:(){
                                                //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                //));

                                              },
                                              child:Container(
                                                  height: 19,
                                                  width: 19,
                                                  child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                              ),
                                            ),
                                          ),
                                        ],
                                      )


                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left:7.0,right: 7.0),
                                    child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // width: 134,
                                            //height: 10,
                                              padding: EdgeInsets.all(5.0),
                                              child: Text("Boosters Remaining: 3 Days",style: TextStyle(fontSize: 12.0,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                        ],),
                                      Column(
                                        children: [
                                          Container(
                                            width: 55,
                                            height: 18,
                                            child:RaisedButton(
                                                padding: EdgeInsets.zero,
                                                color: Color(0xff6F79CC),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: new BorderRadius.circular(100.0)
                                                ),
                                                child: Text("Activate",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                onPressed: (){}
                                            ),
                                          ),
                                        ],),
                                      Column(
                                        children: [
                                          Container(
                                            width: 55,
                                            height: 18,
                                            child:RaisedButton(
                                                padding: EdgeInsets.zero,
                                                color: Color(0xff6F79CC),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: new BorderRadius.circular(100.0)
                                                ),
                                                child: Text("Purchase More",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                onPressed: (){}
                                            ),
                                          ),
                                        ],),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left:7.0,right: 7.0),
                                    child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10.0),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Lifeline:", style: TextStyle(color: Color(0xffFFFFFF),
                                                fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),

                                          ],
                                        ),
                                        SizedBox(height:5.0),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center
                                          ,
                                          children: [
                                            Column(
                                                children:[
                                                  Container(
                                                    width: 18,
                                                    height: 20,
                                                    // padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image:DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              Constant.base_url+"getPdfFile/correct"),
                                                        )

                                                    ),

                                                  ),

                                                ]
                                            ),
                                            Column(
                                              children: [
                                                Text("  Available : ${widget.correct}", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                              ],
                                            ),
                                            SizedBox(width: 110,),
                                            Column(
                                              children: [
                                                Container(
                                                  width: 55,
                                                  height: 18,
                                                  child:RaisedButton(
                                                      padding: EdgeInsets.zero,
                                                      color: Color(0xff6F79CC),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(100.0)
                                                      ),
                                                      child: Text("Activate",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                      onPressed: (){}
                                                  ),
                                                ),
                                              ],),
                                          ],
                                        ),
                                        SizedBox(height:15.0),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  width: 18,
                                                  height: 20,
                                                  padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image:DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            Constant.base_url+"getPdfFile/fiftyfifty"),
                                                      )

                                                  ),

                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text("  Available : ${widget.fifty}", style: TextStyle(color: Color(0xffFFFFFF),
                                                    fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                              ],
                                            ),
                                            SizedBox(width:110),
                                            Column(
                                              children: [
                                                Container(
                                                  width: 55,
                                                  height: 18,
                                                  child:RaisedButton(
                                                      padding: EdgeInsets.zero,
                                                      color: Color(0xff6F79CC),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(100.0)
                                                      ),
                                                      child: Text("Activate",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                      onPressed: (){}
                                                  ),
                                                ),
                                              ],),
                                          ],
                                        ),
                                        SizedBox(height:15.0),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  width: 18,
                                                  height: 20,
                                                  // padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image:DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            Constant.base_url+"getPdfFile/3x"),
                                                      )

                                                  ),

                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text("  Available : ${widget.multiplier}", style: TextStyle(color: Color(0xffFFFFFF),
                                                    fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                              ],
                                            ),
                                            SizedBox(width:110),

                                            Column(
                                              children: [
                                                Container(
                                                  width: 55,
                                                  height: 18,
                                                  child:RaisedButton(
                                                      padding: EdgeInsets.zero,
                                                      color: Color(0xff6F79CC),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(100.0)
                                                      ),
                                                      child: Text("Activate",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                      onPressed: (){}
                                                  ),
                                                ),
                                              ],),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left:6.0,right: 6.0),
                                    child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // width: 181,
                                            // height: 15,
                                              padding: EdgeInsets.all(5.0),
                                              child: Text("View All Questions Answered",style: TextStyle(fontSize: 12.0,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                        ],),
                                      Column(
                                        children: [
                                          Card(
                                          //  elevation: 2,
                                            shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(50.0),
                                              side: BorderSide( color: Color(0xff0D3B9B)),
                                            ),
                                            child: InkWell(
                                              onTap:(){
                                                //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                //));

                                              },
                                              child:Container(
                                                  height: 19,
                                                  width: 19,
                                                  child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                              ),
                                            ),
                                          ),
                                        ],
                                      )


                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(height: 5.0,),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      width: 900,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[

                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: Container(
                              height: 48,
                              width: 83,
                              child: Card(
                                color: Color(0xffFFFFFF),
                                //margin: EdgeInsets.only(right: 300,),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        5.0)
                                ),
                                //  margin: EdgeInsets.all(3.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Screen13(widget.username)
                                        ));
                                  },
                                  child: Center(
                                    child: Image.network(
                                        Constant.base_url +
                                            "getPdfFile/Daily",
                                        fit: BoxFit.cover),
                                    // mainAxisAlignment: MainAxisAlignment.start,


                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              height: 48,
                              width: 83,
                              child: Card(
                                color: Color(0xff15B1F1),
                                //margin: EdgeInsets.only(right: 300,),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        5.0)
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Screen57(widget.username)
                                        ));
                                  },
                                  //margin: EdgeInsets.all(3.0),
                                  //margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                  child: Center(
                                    child: Container(

                                      // padding: EdgeInsets.all(18.0),
                                      child: Image.network(
                                          Constant.base_url +
                                              "getPdfFile/Group 74",
                                          fit: BoxFit.cover),
                                      // mainAxisAlignment: MainAxisAlignment.start,

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: Container(
                              height: 48,
                              width: 83,
                              child: Card(
                                color: Color(0xffFF6A56),
                                //margin: EdgeInsets.only(right: 300,),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        5.0)
                                ),

                                // margin: EdgeInsets.all(3.0),
                                //    margin: EdgeInsets.only(top: 5.0, bottom: 4.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Screen67(widget.username)
                                        ));
                                  },
                                  child: Center(
                                    child: Image.network(
                                        Constant.base_url +
                                            "getPdfFile/Group 99",
                                        fit: BoxFit.cover),
                                    // mainAxisAlignment: MainAxisAlignment.start,

                                  ),

                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                                height: 48,
                                width: 83,
                                child: Card(
                                  color: Color(0xff490092),
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          5.0)
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Screen62(widget.username)
                                          ));
                                    },
                                    //margin: EdgeInsets.all(5),
                                    // margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                    child: Center(
                                      child: Image.network(
                                          Constant.base_url +
                                              "getPdfFile/Group 100",
                                          fit: BoxFit.cover),
                                      // mainAxisAlignment: MainAxisAlignment.start,

                                    ),
                                  ),
                                )
                            ),
                          ),


                        ],
                      ),
                    ), //Container
                  ),
                ],
              ),

          ),
        ),
      ),
    );
  }
}
