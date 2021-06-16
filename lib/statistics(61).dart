import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'MainPage_11.dart';
import 'constants.dart';



class Screen61 extends StatefulWidget {
  @override
  _Screen61State createState() => _Screen61State();
}

class _Screen61State extends State<Screen61> {
  bool selected = false;
  var userStatus = List<bool>();

  String url= 'http://52.15.85.29/challenges';


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
              color: Color(0xff354FC3).withOpacity(0.80),
              padding: EdgeInsets.all(10.0),
              child:  Column(
                    children: [
                      SizedBox(height: 15.0,),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Row(
                          children:[
                            Flexible(
                              child: Card(
                                color: Color(0xff5095E4) ,

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
                        flex:9,
                        fit:FlexFit.tight,
                        child: Card(
                          color:Color(0xff5095E4).withOpacity(0.40),
                          //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),

                          child: Center(
                            child: Column(
                                children: [
                                  Container(
                                    //height: 699,
                                    //width: 341,
                                    margin: EdgeInsets.all(10.0),
                                    child: Column(

                                      mainAxisAlignment: MainAxisAlignment.start ,
                                      children: [
                                        Text("Overall Matches Played", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                                        SizedBox(height: 20,),
                                        Card(
                                          color:Color(0xff5095E4).withOpacity(0.40),
                                          //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(10.0)
                                          ),

                                          child: Center(
                                            child: Column(
                                                children: [
                                                  Container(
                                                    height: 135,
                                                    width: 308,
                                                    margin: EdgeInsets.all(10.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text("Daily",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 14,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700),)


                                                          ],
                                                        ),
                                                        //SizedBox(height:5.0),

                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Matches Played",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                            Text("0",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)


                                                          ],
                                                        ),
                                                        // SizedBox(height:2.0),

                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Matches Won",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                            Text("0",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)


                                                          ],
                                                        ),
                                                        // SizedBox(height:5.0),

                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Matches Lost",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                            Text("0",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)


                                                          ],
                                                        ),

                                                      ],
                                                    ),








                                                  ),

                                                ]
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Card(
                                          color:Color(0xff5095E4).withOpacity(0.40),
                                          //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(10.0)
                                          ),

                                          child: Center(
                                            child: Column(
                                                children: [
                                                  Container(
                                                    height: 135,
                                                    width: 308,
                                                    margin: EdgeInsets.all(10.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text("Weekly",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 14,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700),)


                                                          ],
                                                        ),
                                                        //SizedBox(height:5.0),

                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Matches Played",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                            Text("0",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)


                                                          ],
                                                        ),
                                                        // SizedBox(height:5.0),

                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Matches Won",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                            Text("0",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)


                                                          ],
                                                        ),
                                                        // SizedBox(height:5.0),

                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Matches Lost",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                            Text("0",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)


                                                          ],
                                                        ),

                                                      ],
                                                    ),








                                                  ),

                                                ]
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Card(
                                          color:Color(0xff5095E4).withOpacity(0.40),
                                          //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(10.0)
                                          ),

                                          child: Container(
                                            child: Center(
                                              child: Column(
                                                  children: [
                                                    Container(
                                                      height: 135,
                                                      width: 308,
                                                      margin: EdgeInsets.all(10.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text("Lifetime",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 14,
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w700),)


                                                            ],
                                                          ),
                                                          // SizedBox(height:5.0),

                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text("Matches Played",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                              Text("0",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)


                                                            ],
                                                          ),
                                                          //SizedBox(height:5.0),

                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text("Matches Won",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                              Text("0",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)


                                                            ],
                                                          ),
                                                          // SizedBox(height:5.0),

                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text("Matches Lost",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                              Text("0",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)


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



                                      ],
                                    ),
                                  ),

                                ]
                            ),
                          ),
                        ),
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
