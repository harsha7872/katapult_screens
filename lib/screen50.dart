import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constants.dart';



class Screen50 extends StatefulWidget {
  @override
  _Screen50State createState() => _Screen50State();
}

class _Screen50State extends State<Screen50> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueAccent ,
      body:SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child:Container(
            color: Color(0xff13BBAA).withOpacity(0.80),
            child: Container(
              margin: EdgeInsets.only(left:10.0,right:10.0,bottom:320.0,top:50.0),
              child: Column(
                children: [
                  Card(
                    color: Color(0xff99CFD6).withOpacity(0.40),
                    // margin: EdgeInsets.all(8.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child: Container(
                      height:617 ,
                      width: 341,
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget> [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Scores",style:TextStyle(color:Color(0xff000000),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                              alignment: Alignment.center,
                                              children: <Widget>[
                                                Image.network(Constant.base_url+"getPdfFile/eclipse",color: Color(0xff3644BA),),
                                                Text("K",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontWeight: FontWeight.w700,fontFamily: 'Montserrat')),
                                              ]
                                          ),
                                          Text("Chips \nEarned",style:TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),

                                        ],
                                      ),

                                    ],
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("You:2",style:TextStyle(color:Color(0xff000000),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),
                                    ],
                                  ),

                                  Text("10",style:TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Emma:2",style:TextStyle(color:Color(0xff000000),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),
                                  Text("9",style:TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Scarlett:2",style:TextStyle(color:Color(0xff000000),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),
                                  Text("10",style:TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("John:0",style:TextStyle(color:Color(0xff000000),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),
                                  Text("0",style:TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Kristine:0",style:TextStyle(color:Color(0xff000000),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),
                                  Text("0",style:TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Miley:2",style:TextStyle(color:Color(0xff000000),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),
                                  Text("10",style:TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 12)),

                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff707070),),
                              ),
                              SizedBox(height: 25,),

                              Align(
                                alignment: Alignment.topCenter  ,
                                child: Column(
                                  //  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child:  Text("       History,\nPolitical History,\n   British Empire", style: TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontFamily: 'Montserrat',fontSize: 24)),
                                    ),
                                  ],),
                              ),
                              SizedBox(height: 25,),
                              Align(
                                alignment: Alignment.topCenter  ,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Text("Question 2", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.w600,fontFamily: 'Montserrat',),),
                                    ],
                                  ),
                                ),
                              ),


                              SizedBox(height: 150,),
                              Align(
                                alignment: Alignment.topCenter  ,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Text("Quit(3)", style: TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 13)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),






                            ]
                        ),

                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


