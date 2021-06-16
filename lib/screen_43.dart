import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/screen_46.dart';

import 'MainPage_11.dart';
import 'Screen14_Notifications.dart';
import 'constants.dart';

class Screen43 extends StatefulWidget {
  String username;
  String matchmode;
  String name1;
  String email;
  int correct,fifty,multiplier;
  List<String> selectedList = [];
  @override
  _Screen43State createState() => _Screen43State();
  Screen43(this.selectedList,this.username,this.name1,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);
}

class _Screen43State extends State<Screen43> {
  String email;
  String matchmode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Color(0xff13BBAA),
        body:SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child: Container(
                color: Color(0xff13BBAA).withOpacity(0.80),
                child:Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                      children: [
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
                                    Text("Hi ${widget.username},", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                    SizedBox(height:5.0),
                                    Text("Its time to play!",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                  ],
                                ),
                                SizedBox(width:100.0),
                                Column(
                                  children: [
                                    GestureDetector(
                                        onTap:(){


                                         Navigator.of(context).pushReplacement(MaterialPageRoute(
                                           builder: (context) => Screen14(widget.username)
                                            ));

                                        },
                                        child: Image.network(Constant.base_url+"getPdfFile/Message"))
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
                        SizedBox(height: 10.0,),
                        Container(
                          // padding: const EdgeInsets.only(left:20.0,right: 20,top: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment. spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Card(
                                    color: Color(0xff3644BA),
                                    //margin: EdgeInsets.all(30.0),
                                    // margin: EdgeInsets.only(right: 100,top: 10.0),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0)
                                    ),
                                    child: Center(
                                      child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          children:<Widget> [
                                            Row(
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
                                          ],
                                        ),
                                        // mainAxisAlignment: MainAxisAlignment.start,

                                      ),
                                    ),
                                  ),
                                ],),
                              Column(
                                children: [
                                  Container(
                                    height: 53,
                                    width: 178,
                                    child: RaisedButton(
                                      color: Color(0xff0A6E75),
                                      textColor: Color(0xffFFFFFF),
                                      onPressed: (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (context) => Screen46(widget.username,widget.selectedList,widget.name1,email,widget.correct,widget.fifty,widget.multiplier,matchmode)
                                        ));
                                      },
                                      //padding: const EdgeInsets.only(left: 35,right: 34,top: 17,bottom: 17),
                                      child: Text("Start Game Anyway".toUpperCase(),style: TextStyle( fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0)),
                                    ),
                                  ),


                                ],),

                            ],
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Column(
                          children: [
                            Container(
                              height: 580,
                              width: 341,
                              child: Card(
                                color: Color(0xff99CFD6).withOpacity(0.40),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)
                                ),
                                child: Center(

                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:<Widget> [
                                        SizedBox(height: 20,),
                                        Text(" Waiting for all player\n      to come online",style: TextStyle(color: Color(0xffFFFFFF), fontSize: 24,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                                        SizedBox(height: 40,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 40,),
                                            Container(
                                              width: 75,
                                              height: 75,
                                              padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+"getPdfFile/Ellipse 34"),
                                                  )

                                              ),

                                            ),
                                            SizedBox(width:20,),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "John Doe",
                                                      style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                                SizedBox(height:3,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Beginner ",
                                                      style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                                SizedBox(height: 3,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Level  2 ",
                                                      style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),


                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Container(
                                                  child: Row(
                                                    //mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Image.network(Constant.base_url+"getPdfFile/india"),
                                                      SizedBox(width: 5,),
                                                      Text("India",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),

                                            SizedBox(width: 60,),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 15.0,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Accepted",
                                                  style: TextStyle(color: Color(0xff9AF988),fontSize: 10,
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                              ),
                                            ),
                                          ],),
                                        SizedBox(height: 40,),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 40,),
                                            Container(
                                              width: 75,
                                              height: 75,
                                              padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+"getPdfFile/Ellipse 35"),
                                                  )

                                              ),

                                            ),
                                            SizedBox(width:20,),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "John Doe",
                                                      style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                                SizedBox(height:3,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Beginner ",
                                                      style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                                SizedBox(height: 3,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Level  2 ",
                                                      style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),


                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Image.network(Constant.base_url+"getPdfFile/india"),
                                                      SizedBox(width: 5,),
                                                      Text("India",style: TextStyle(color: Color(0xffFFFFFF),
                                                          fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),

                                            SizedBox(width: 60,),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 15.0,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Rejected",
                                                  style: TextStyle(color: Color(0xffD35627),fontSize: 10,
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                              ),
                                            ),
                                          ],),
                                        SizedBox(height: 40,),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 40,),
                                            Container(
                                              width: 75,
                                              height: 75,
                                              padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+"getPdfFile/Ellipse 36"),
                                                  )

                                              ),

                                            ),
                                            SizedBox(width:20,),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "John Doe ",
                                                      style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                                SizedBox(height:3 ,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Beginner ",
                                                      style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                  ],
                                                ),
                                                SizedBox(height: 3,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Level  2 ",
                                                      style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),


                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Image.network(Constant.base_url+"getPdfFile/india"),
                                                      SizedBox(width: 5,),
                                                      Text("India",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),

                                            SizedBox(width: 60,),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 15.0,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Waiting",
                                                  style: TextStyle(color: Color(0xff3E6B9E),fontSize: 10,
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                              ),
                                            ),
                                          ],),

                                      ]
                                  ),

                                ),
                              ),
                            ),

                          ],
                        ),
                      ]
                  ),

                )
            ),
          ),
        )
    );
  }
}



