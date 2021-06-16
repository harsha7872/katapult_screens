import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';



class Screen54 extends StatefulWidget {
  @override
  _Screen54State createState() => _Screen54State();
}

class _Screen54State extends State<Screen54> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent ,
      body:SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child:Container(
              color: Color(0xff13BBAA).withOpacity(0.80),

              child:Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left:10.0,right:10.0,bottom:320.0,top:50.0),
                    child: Center(
                      child: Column(
                        children:<Widget> [
                          SizedBox(height: 50,),
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
                          SizedBox(height: 30,),
                          Align(
                            alignment: Alignment.topCenter  ,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text("Tie-Breaker \n    Round", style: TextStyle(
                                      fontSize: 50.0,
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Montserrat'
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Card(
                            color: Color(0xff99CFD6).withOpacity(0.40),
                            // margin: EdgeInsets.all(8.0),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height:155 ,
                              width: 341,
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Between",style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w600,fontFamily: 'Montserrat'
                                      ),),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Row(

                                                  children: [
                                                    Container(
                                                      width: 47,
                                                      height: 47,
                                                      padding: EdgeInsets.all(5.0),
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle ,
                                                          image:DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(Constant.base_url+"getPdfFile/anand"),
                                                          )

                                                      ),
                                                    ),

                                                    Container(
                                                      padding: EdgeInsets.all(5.0),
                                                      child:  Text(
                                                        "Anand  \n120",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Color(0xffFFFFFF),
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'Montserrat'
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ],

                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Emma \n      120",
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Color(0xffFFFFFF),
                                                          fontWeight: FontWeight.w600,
                                                          fontFamily: 'Montserrat'
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 47,
                                                      height: 47,
                                                      //  padding: EdgeInsets.only(top: 40.0,bottom: 130.0),
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle ,
                                                          image:DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(Constant.base_url+"getPdfFile/Ellipse 34"),
                                                          )

                                                      ),
                                                    ),


                                                  ],
                                                ),
                                              ],

                                            ),
                                          ]
                                      ),
                                    ],
                                  )

                              ),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Opacity(
                            opacity: 0.4,
                            child: Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Row(

                                          children: [
                                            Container(
                                              width: 47,
                                              height: 47,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle ,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+"getPdfFile/Ellipse 28"),
                                                  )

                                              ),
                                            ),

                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              child:  Text(
                                                "Scarllet \n120",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Color(0xffFFFFFF),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],

                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "John \n   120",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Color(0xffFFFFFF),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat'
                                              ),
                                            ),
                                            Container(
                                              width: 47,
                                              height: 47,
                                              //  padding: EdgeInsets.only(top: 40.0,bottom: 130.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle ,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+"getPdfFile/Ellipse 35"),
                                                  )

                                              ),
                                            ),


                                          ],
                                        ),
                                      ],

                                    ),
                                  ]
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Opacity(
                            opacity: 0.4,
                            child: Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Row(

                                          children: [
                                            Container(
                                              width: 47,
                                              height: 47,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle ,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+"getPdfFile/Ellipse 32"),
                                                  )

                                              ),
                                            ),

                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              child:  Text(
                                                "Kristine \n120",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Color(0xffFFFFFF),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],

                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Miley \n   120",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Color(0xffFFFFFF),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat'
                                              ),
                                            ),
                                            Container(
                                              width: 47,
                                              height: 47,
                                              //  padding: EdgeInsets.only(top: 40.0,bottom: 130.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle ,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+"getPdfFile/Ellipse 31"),
                                                  )

                                              ),
                                            ),


                                          ],
                                        ),
                                      ],

                                    ),
                                  ]
                              ),
                            ),
                          ),


                          SizedBox(height: 80,),
                          Align(
                            alignment: Alignment.topCenter  ,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text("Game starts in ....3",  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat'
                                  ),),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),


                  ),

                ],
              )



          ),
          // mainAxisAlignment: MainAxisAlignment.start,

        ),


      ),
    );

  }
}


