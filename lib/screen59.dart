import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'MainPage_11.dart';
import 'constants.dart';

class Screen59 extends StatefulWidget {
  @override
  _Screen59State createState() => _Screen59State();
}

class _Screen59State extends State<Screen59> {
  TextEditingController _category= new TextEditingController();
  String _ques;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff707070),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child:Container(
            color: Color(0xff354FC3).withOpacity(0.80),
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
                                  color: Color(0xff5095E4),
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
                                      ),

                                    ),
                                    // mainAxisAlignment: MainAxisAlignment.start,

                                  ),
                                ),
                              ],),
                          ]
                      ),
                    ),
                    Card(
                      color: Color(0xff5095E4).withOpacity(0.40),
                      margin: EdgeInsets.all(8.0),
                      //margin: EdgeInsets.all(8),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      ),
                      child: Container(
                        width: 500,
                        height: 750,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:15.0),
                              child: Text("Weekly Leaderboard",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),),
                            ),
                            Card(
                              color: Color(0xff5095E4).withOpacity(0.60),
                              //margin: EdgeInsets.all(30.0),
                              margin: EdgeInsets.all(20),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0)
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                width: 325,
                                height: 160,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top:0.0),
                                        child: Text("At the End of Week, top 3 player will be rewarded:",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),),
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                                children: [
                                                  Text("1",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),),
                                                  Text("st Reward",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),),

                                                ]
                                            ),
                                            Row(
                                              children: [
                                                Card(
                                                  color: Color(0xff5095E4).withOpacity(0.60),
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
                                                      "K",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                Text("1000",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w700),),
                                              ],
                                            ),
                                          ]
                                      ),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                                children: [
                                                  Text("2",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),),
                                                  Text("nd Reward",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),),

                                                ]
                                            ),
                                            Row(
                                              children: [
                                                Card(
                                                  color: Color(0xff5095E4).withOpacity(0.60),
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
                                                      "K",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5,),
                                                Text("500",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w700),),
                                              ],
                                            ),
                                          ]
                                      ),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                                children: [
                                                  Text("3",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),),
                                                  Text("rd Reward",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600),),

                                                ]
                                            ),
                                            Row(
                                              children: [
                                                Card(
                                                  color: Color(0xff5095E4).withOpacity(0.60),
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
                                                      "K",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5,),
                                                Text("300",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w700),),
                                              ],
                                            ),
                                          ]
                                      ),
                                    ]
                                ),
                              ),
                            ),

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("Rank",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Name",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 140.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("Total Score",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 10.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("1",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/John'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("John",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("48",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("2",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/Emma'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Emma",style:TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("42",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("3",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/Scarlett'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Scarlett",style:TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("34",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Container(
                                  color: Color(0xff17B5F3).withOpacity(0.40),
                                  child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.only(left: 20.0)),
                                      Column(
                                        children: [
                                          Container(
                                              width: 25,
                                              height: 15,
                                              child: Text("4",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                        ],),
                                      Padding(padding: EdgeInsets.only(left: 50.0)),
                                      Column(
                                        children: [
                                          Padding(padding: EdgeInsets.only(left: 10.0),),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            padding: EdgeInsets.only(left: 30.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image:DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(Constant.base_url+'getPdfFile/Ellipse 2'),
                                                )

                                            ),


                                          ),
                                        ],),
                                      Padding(padding: EdgeInsets.only(left: 5.0)),
                                      Column(
                                        children: [
                                          Container(
                                              width: 35,
                                              height: 10,
                                              child: Text("You",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                        ],),
                                      Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                      Column(
                                        children: [
                                          Container(
                                              child: Text("30",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                        ],),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("5",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/Kristine'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Kristine",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("24",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("6",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/Milley'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Milley",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("16",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("7",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/John'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("John",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("15",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("8",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/Emma'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Emma",style:TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("15",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("9",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/Scarlett'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Scarlett",style:TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("15",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("10",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/Kris'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Kris",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("14",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("11",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/Nora'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Nora",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("12",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 25,
                                            height: 15,
                                            child: Text("12",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 50.0)),
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 10.0),),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: EdgeInsets.only(left: 30.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image:DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(Constant.base_url+'getPdfFile/Criss'),
                                              )

                                          ),


                                        ),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 5.0)),
                                    Column(
                                      children: [
                                        Container(
                                            width: 35,
                                            height: 10,
                                            child: Text("Criss",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),
                                      ],),
                                    Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                    Column(
                                      children: [
                                        Container(
                                            child: Text("4",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white),)),

                                      ],),
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    )
                  ]

              ),
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
