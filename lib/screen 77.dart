import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:circular_check_box/circular_check_box.dart';

import 'MainPage_11.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Screen34(),
    );
  }
}


class Screen34 extends StatefulWidget {
  @override
  _Screen34State createState() => _Screen34State();
}

class _Screen34State extends State<Screen34> {
  TextEditingController _category= new TextEditingController();
  String _ques;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff707070),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                fit: BoxFit.cover)),
        child:Container(
          color: Color(0xffFFFFFF).withOpacity(0.95),
          child: Container(
            margin: EdgeInsets.only(left:17.0,right:17.0,bottom:15.0,top:10.0),
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Color(0xff3644BA),
                                //margin: EdgeInsets.all(30.0),
                                margin: EdgeInsets.all(8),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Container(
                                    // padding: EdgeInsets.all(10.0),
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                builder: (context) => Screen1(),
                                              ));
                                            },
                                            icon: Icon(Icons.arrow_back,color: Colors.white,),
                                          ),
                                          Icon(Icons.home,color: Colors.white,)
                                        ],
                                      ),
                                    ),

                                  ),
                                  // mainAxisAlignment: MainAxisAlignment.start,

                                ),
                              ),
                              Card(
                                color: Color(0xff16C5BE),
                                //margin: EdgeInsets.all(30.0),
                                margin: EdgeInsets.all(8),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Container(
                                    // padding: EdgeInsets.all(10.0),
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.arrow_back,color: Colors.white,size: 15,),
                                          ),
                                          Text("Back", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 16),)
                                        ],
                                      ),
                                    ),

                                  ),
                                  // mainAxisAlignment: MainAxisAlignment.start,

                                ),
                              ),
                            ],),
                        ]
                    ),
                  ),

                  Align(
                    //alignment: Alignment.topRight ,
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Card(
                        color: Color(0xffAB75EB),
                        margin: EdgeInsets.all(8),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: 350,
                          height: 170,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("C:", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  SizedBox(width: 20,),
                                  Text("Education", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Text("Q:", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  SizedBox(width: 20,),
                                  Text("The International Literacy Day is observed on", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                children: [
                                  SizedBox(width: 30,),
                                  Text("A. Sep 8", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 7),),
                                  SizedBox(width: 100,),
                                  Text("B. Nov 28", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 7),),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                children: [
                                  SizedBox(width: 30,),
                                  Text("C. May 2", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 7),),
                                  SizedBox(width: 100,),
                                  Text("D. Sep 22", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 7),),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Text("A:", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  SizedBox(width: 20,),
                                  Text("A. Sep 8", style: TextStyle(color: Color(0xffFFFFFF),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                  Align(
                    //alignment: Alignment.topRight ,
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
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
                                          Constant.base_url+'getPdfFile/Ellipse 2'),
                                    )

                                ),

                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                width: 300,
                                height: 50,
                                child:  TextFormField(
                                  autofocus: false,
                                  controller: _category,
                                  validator: validateEmail,
                                  onChanged: (value) => _ques = value,

                                  decoration: new InputDecoration(
                                    contentPadding: const EdgeInsets.all(16.0),
                                    hintText: '| Your Question',
                                    hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),
                                    //prefixIcon: _prefixIcon( Icons.email),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 50.0,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Card(
                        color: Color(0xffFFFFFF),
                        //margin: EdgeInsets.all(30.0),
                        margin: EdgeInsets.all(8),
                        elevation: 5,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            side: BorderSide(color: Color(0xff707070))
                        ),
                        child: Center(
                          child: Container(

                            child: Padding(
                                padding: const EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),
                                child:
                                Text("Post", style: TextStyle(color: Color(0xff707070),
                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 12),)

                            ),
                          ),
                        ),

                      ),
                      ]
                  ), //



                ]

            ),
          ),
        ),
      ),




    );
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (value.length == 0) {
    return "Email is Required *";
  } else if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
