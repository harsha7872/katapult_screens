import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/Daily_challenges13.dart';
import 'package:katapult_screens/search.dart';
import 'Leaderboard(57).dart';
import 'MainPage_11.dart';
import 'Marketplace.dart';
import 'Social(67).dart';
import 'constants.dart';

class Screen14 extends StatefulWidget {
  String username;
  @override
  _Screen14State createState() => _Screen14State();
  Screen14(this.username);
}

class _Screen14State extends State<Screen14> {
  bool selected = false;
  var userStatus = List<bool>();
  int counter=0;
  List data;
  // ignore: missing_return
  Future<String> makeRequest() async {
    String url= Constant.base_url+"/notifications";
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
    double screenWidth = MediaQuery.of(context).size.width;
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
              color: Color(0xff000877).withOpacity(0.80),
              child: Container(
                padding: EdgeInsets.all(8.0),

                child: Column(
                    children: [
                      SizedBox(height: 15.0,),
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
                                      SizedBox(width:40.0),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                             /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                  builder: (context) => Screen14(sata[0]["firstName"])
                                              ));*/
                                              setState(() {
                                                counter = 0;
                                              });
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
                                      SizedBox(width:0.0),
                                      Column(
                                        children: [

                                          GestureDetector(
                                              onTap:(){
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                    builder: (context) => Search()
                                                ));
                                              },
                                              child:  Image.network(Constant.base_url+"getPdfFile/Search"))
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
                      SizedBox(height: 5.0,),
                      Flexible(
                        flex:8,
                        fit: FlexFit.tight,
                        child: Card(
                          color:Color(0xff36A3BA).withOpacity(0.40),
                          //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),

                          child: Center(
                            child: Column(
                                children: [
                                  Container(
                                    // padding: EdgeInsets.all(10.0),
                                    // height: 520/SizeConfig.heightMultiplier)*SizeConfig.heightMultiplier,
                                    //width:(900/SizeConfig.widthMultiplier)*SizeConfig.widthMultiplier,
                                    margin: EdgeInsets.all(20.0),
                                    child: Column(

                                      mainAxisAlignment: MainAxisAlignment.start ,
                                      children: [
                                        Text("Notifications", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                                        SizedBox(height: 30.0,),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  //width: 115,
                                                  // height: 15,
                                                    child: Text("New questions added in General Knowledge Category",
                                                      style: TextStyle(fontSize: 8.0,
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
                                                      child: Text("Play Now",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                      onPressed: (){}
                                                  ),
                                                ),
                                              ],),


                                          ],
                                        ),
                                        SizedBox(height: 30.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                    width: 126,
                                                    height: 10,
                                                    child: Text("New categories added:Cricket",style: TextStyle(fontSize: 8.0,
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
                                                      child: Text("Play Now",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600 ),),
                                                      onPressed: (){}
                                                  ),
                                                ),
                                              ],),


                                          ],
                                        ),
                                        SizedBox(height: 30.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  //     width: 134,
                                                  //   height: 10,
                                                    child: Text("Its your turn now in Maths game",style: TextStyle(fontSize: 8.0,
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
                                                      child: Text("Play Now",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                      onPressed: (){}
                                                  ),
                                                ),
                                              ],),


                                          ],
                                        ),
                                        SizedBox(height: 30.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                    width: 295,
                                                    height: 23,
                                                    child: Text("Your suggested question with 'How many stars.....' is approved in Space Category",style: TextStyle(fontSize: 8.0,
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                              ],),



                                          ],
                                        ),
                                        SizedBox(height: 30.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                    width: 295,
                                                    height: 23,
                                                    child: Text("Your suggested question with 'What is RAM in computer.' is rejected in Computers Category",style: TextStyle(fontSize: 8.0,
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                              ],),



                                          ],
                                        ),
                                        SizedBox(height: 30.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                    width: 202,
                                                    height: 10,
                                                    child: Text('Your comment is replied in "How to play..." forum',style: TextStyle(fontSize: 8.0,
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
                                                      child: Text("Check Reply",style: TextStyle(fontSize: 5.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                      onPressed: (){}
                                                  ),
                                                ),
                                              ],),


                                          ],
                                        ),
                                        SizedBox(height: 30.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                    width: 186,
                                                    height: 10,
                                                    child: Text('You have been crossed in puzzle leaderboard',style: TextStyle(fontSize: 8.0,
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
                                                      child: Text("Play Now",style: TextStyle(fontSize: 5.0,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                      onPressed: (){}
                                                  ),
                                                ),
                                              ],),


                                          ],
                                        ),




                                      ],
                                    ),
                                  ),

                                ]
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
                                      width: 83,
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
                                      width: 83,
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
                                        width: 83,
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
                                        width: 83,
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



      ),
    );
  }
  void moveToLastScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Screen1(),
    ));
  }
}
