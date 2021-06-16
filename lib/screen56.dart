import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'constants.dart';


class Screen56 extends StatefulWidget {
  Screen56({Key key}) : super(key: key);
  @override
  _Screen56State createState() => new _Screen56State();
}

class _Screen56State extends State<Screen56> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:SingleChildScrollView(
          child: Container(decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
              child:  Container(
                color: Color(0xff13BBAA).withOpacity(0.80),
                child: Column(
                    children: <Widget>[
                      //card is used to naviagte to home screen
                      Card(
                        color: Color(0xff3644BA) ,
                        margin: EdgeInsets.only(top: 30.0,right: 310.0,left: 25.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Center(
                          child: Container(
                            height: 45,
                            padding: EdgeInsets.all(7.0),
                            child: Column(
                              children:<Widget> [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_back,color: Colors.white,size: 15,),
                                    Icon(Icons.home,color: Colors.white)
                                  ],
                                ),
                              ],
                            ),
                            // mainAxisAlignment: MainAxisAlignment.start,

                          ),
                        ),
                      ),
                      Card(
                        color: Color(0xff99CFD6).withOpacity(0.60),
                        margin: EdgeInsets.only(top: 15.0,bottom: 10.0,right: 25.0,left: 25.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Center(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //shows the topic which is choosed by the user
                              Padding(
                                padding: EdgeInsets.only(top:15.0),
                                child: Text("History, Political History,",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat'),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top:10.0),
                                child: Text("British Empire",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat'),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top:15.0),
                                child: Text("Congratulations,",style: TextStyle(color: Color(0xff3644BA),fontSize: 18,fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat'),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top:0.0),
                                child: Text(" You are the winner",style: TextStyle(color: Color(0xff3644BA),fontSize: 18,fontWeight: FontWeight.w700,
                                    fontFamily: 'Montserrat'),),
                              ),
                              SizedBox(height: 15,),
                              Padding(
                                padding: const EdgeInsets.only(left:10.0,right: 10.0),
                                child: Divider(thickness: 2,),
                              ),
                              SizedBox(height: 15,),
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
                                            padding: EdgeInsets.only(top: 30.0,bottom: 100.0),

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
                                      Column(children:[ Text("Your Score Card",style: TextStyle(color: Color(0xff04D9F8),fontSize: 21,fontWeight: FontWeight.w700,
                                          fontFamily: 'Montserrat'),),
                                        Text("Total Questions Answered : 24",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700,
                                            fontFamily: 'Montserrat'),),
                                      ]),

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0,),
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
                                                  "48",style: TextStyle(color: Color(0xffC10B0B),fontSize: 10,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),
                                                ),
                                              ),
                                            ),
                                            Text("Total Score",style: TextStyle(fontSize: 10.0,color: Color(0xffC10B0B),fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat'),),
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
                                                  "2400",style: TextStyle(color: Color(0xff3644BA),fontSize: 10,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),
                                                ),
                                              ),
                                            ),
                                            Text("Chips Earned",style: TextStyle(fontSize: 10.0,color: Color(0xff3644BA),fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat'),),
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
                                                  "4800",style: TextStyle(color: Color(0xffB71570),fontSize: 10,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),
                                                ),
                                              ),
                                            ),
                                            Text("Exp. Gained",style: TextStyle(fontSize: 10.0,color: Color(0xffB71570),fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat'),),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment. spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Card(
                                              color: Color(0xff1AA6B0) ,
                                              // margin: EdgeInsets.only(top: 30.0,right: 310.0,left: 25.0),
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius: new BorderRadius.circular(10.0)
                                              ),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 139,
                                                height: 29,
                                                child: Text("Review Questions",style: TextStyle(fontSize: 12.0,color: Color(0xffFFFFFF),fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Card(
                                              color: Color(0xff1AA6B0) ,
                                              //margin: EdgeInsets.only(top: 30.0,right: 310.0,left: 25.0),
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius: new BorderRadius.circular(10.0)
                                              ),
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  width: 172,
                                                  height: 29,
                                                  child:Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("Watch Video for",style: TextStyle(fontSize: 12.0,color: Color(0xffFFFFFF),fontWeight: FontWeight.w600,
                                                          fontFamily: 'Montserrat'),),
                                                      Row(
                                                        children: [
                                                          Card(
                                                            color: Color(0xff3644BA).withOpacity(0.60),
                                                            //margin: EdgeInsets.all(30.0),
                                                            margin: EdgeInsets.all(4),
                                                            shape: new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(10.0)
                                                            ),
                                                            child: Container(
                                                              alignment: Alignment.center,
                                                              width: 17,
                                                              height: 17,
                                                              child: Text(
                                                                "K",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w700,
                                                                  fontFamily: 'Montserrat'),
                                                              ),
                                                            ),
                                                          ),
                                                          Text("25",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontWeight: FontWeight.w600,
                                                              fontFamily: 'Montserrat'),),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.0,),
                                  ]
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Color(0xff0A6E75).withOpacity(0.0),
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
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
                                            Text("Complete Score card",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat'),)
                                          ],
                                        ),
                                        Column(children:[
                                          Icon(Icons.share,color: Colors.white,)
                                        ]),

                                      ],
                                    ),

                                  ),
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 20.0)),
                                        Column(
                                          children: [
                                            Container(
                                                width: 30,
                                                height: 15,
                                                child: Text("Rank",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 45.0)),
                                        Column(
                                          children: [
                                            Container(
                                                width: 35,
                                                height: 10,
                                                child: Text("Name",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),


                                        Padding(padding: EdgeInsets.only(left: 150.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("Total Score",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

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
                                                child: Text("1",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
                                              padding: EdgeInsets.only(left: 30.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+'getPdfFile//Ellipse 2'),
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
                                                child: Text("You",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 135.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("48",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

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
                                                child: Text("2",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
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
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 5.0)),
                                        Column(
                                          children: [
                                            Container(
                                                width: 35,
                                                height: 10,
                                                child: Text("Emma",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 20.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Card(
                                                  color: Color(0xffFFFFFF),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(50.0)
                                                  ),
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      width: 10,
                                                      height: 10,
                                                      child: Icon(Icons.remove_red_eye,size: 8,)
                                                  ),
                                                ),
                                                SizedBox(width: 16,),
                                                Card( color: Color(0xff0A6E75),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(10.0),
                                                      side: BorderSide(color: Color(0xff1AA6B0))
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 42,
                                                    height: 14,
                                                    child: Text("Add Friend",style: TextStyle(fontSize: 5,color: Colors.white,fontWeight: FontWeight.w600,
                                                        fontFamily: 'Montserrat'),),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 40.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("42",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

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
                                                child: Text("3",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
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
                                                width: 40,
                                                height: 10,
                                                child: Text("Scarlett",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 15.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Card(
                                                  color: Color(0xffFFFFFF),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(50.0)
                                                  ),
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      width: 10,
                                                      height: 10,
                                                      child: Icon(Icons.remove_red_eye,size: 8,)
                                                  ),
                                                ),
                                                SizedBox(width: 16,),
                                                Card( color: Color(0xff0A6E75),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(10.0),
                                                      side: BorderSide(color: Color(0xff1AA6B0))
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 42,
                                                    height: 14,
                                                    child: Text("Add Friend",style: TextStyle(fontSize: 5,color: Colors.white,fontWeight: FontWeight.w600,
                                                        fontFamily: 'Montserrat'),),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 40.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("36",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

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
                                                child: Text("4",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
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
                                                child: Text("John",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 20.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Card(
                                                  color: Color(0xffFFFFFF),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(50.0)
                                                  ),
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      width: 10,
                                                      height: 10,
                                                      child: Icon(Icons.remove_red_eye,size: 8,)
                                                  ),
                                                ),
                                                SizedBox(width: 16,),
                                                Card( color: Color(0xff0A6E75),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(10.0),
                                                      side: BorderSide(color: Color(0xff1AA6B0))
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 42,
                                                    height: 14,
                                                    child: Text("Add Friend",style: TextStyle(fontSize: 5,color: Colors.white,fontWeight: FontWeight.w600,
                                                        fontFamily: 'Montserrat'),),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 40.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("30",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

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
                                                width: 30,
                                                height: 15,
                                                child: Text("5",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 45.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
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
                                                width: 40,
                                                height: 10,
                                                child: Text("Kristine",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 15.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Card(
                                                  color: Color(0xffFFFFFF),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(50.0)
                                                  ),
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      width: 10,
                                                      height: 10,
                                                      child: Icon(Icons.remove_red_eye,size: 8,)
                                                  ),
                                                ),
                                                SizedBox(width: 16,),
                                                Card( color: Color(0xff0A6E75),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(10.0),
                                                      side: BorderSide(color: Color(0xff1AA6B0))
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 42,
                                                    height: 14,
                                                    child: Text("Add Friend",style: TextStyle(fontSize: 5,color: Colors.white,fontWeight: FontWeight.w600,
                                                        fontFamily: 'Montserrat'),),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 40.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("24",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

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
                                                child: Text("6",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
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
                                                height: 12,
                                                child: Text("Milley",style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600,color: Colors.white,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 20.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Card(
                                                  color: Color(0xffFFFFFF),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(50.0)
                                                  ),
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      width: 10,
                                                      height: 10,
                                                      child: Icon(Icons.remove_red_eye,size: 8,)
                                                  ),
                                                ),
                                                SizedBox(width: 16,),
                                                Card( color: Color(0xff0A6E75),
                                                  //margin: EdgeInsets.all(30.0),
                                                  margin: EdgeInsets.all(0),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(10.0),
                                                      side: BorderSide(color: Color(0xff1AA6B0))
                                                  ),
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 42,
                                                    height: 14,
                                                    child: Text("Add Friend",style: TextStyle(fontSize: 5,color: Colors.white,fontWeight: FontWeight.w600,
                                                        fontFamily: 'Montserrat'),),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 40.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("16",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

                                          ],),

                                      ],
                                    ),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12,right: 12),
                                      child: Divider(thickness: 2,),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment. spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Card(
                                              color: Color(0xff0A6E75) ,
                                              // margin: EdgeInsets.only(top: 30.0,right: 310.0,left: 25.0),
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius: new BorderRadius.circular(10.0)
                                              ),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 78,
                                                height: 29,
                                                child: Text("Rematch",style: TextStyle(fontSize: 12.0,color: Color(0xffFFFFFF),fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Card(
                                              color: Color(0xff0A6E75) ,
                                              //margin: EdgeInsets.only(top: 30.0,right: 310.0,left: 25.0),
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius: new BorderRadius.circular(10.0)
                                              ),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 220,
                                                height: 29,
                                                child:Text("Rematch with different people",style: TextStyle(fontSize: 12.0,color: Color(0xffFFFFFF),fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.0,),


                                  ],
                                ),

                              ],
                            )
                        ),
                      ),
                      Card(
                        color: Color(0xff0A6E75).withOpacity(0.50),
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
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
                                            Text("Leaderboard",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat'),)
                                          ],
                                        ),
                                        Column(children:[
                                          Card(
                                            color: Color(0xff0A6E75),
                                            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(10.0),
                                                side: BorderSide(color: Color(0xff1AA6B0))
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 55,
                                              height: 18,
                                              child: Text(
                                                "View Full Details",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 5,fontWeight: FontWeight.w600,
                                                  fontFamily: 'Montserrat'),
                                              ),
                                            ),
                                          )
                                        ]),

                                      ],
                                    ),

                                  ),
                                ),
                                Card(
                                  color: Color(0xff1AA6B0),
                                  //margin: EdgeInsets.all(30.0),
                                  margin: EdgeInsets.only(left: 15,right: 15),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      side: BorderSide(color: Color(0xff0A6E75))
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 300,
                                      height: 30,
                                      // padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Text("Category: History", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                          IconButton(
                                            icon: Icon(Icons.keyboard_arrow_down,color: Color(0xffFFFFFF),size: 12,),
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
                                    color: Color(0xff1AA6B0),
                                    width: 330,
                                    height: 30,
                                    child: TabBar(
                                      // unselectedLabelColor: Color(0xff1AA6B0),
                                        indicator: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xff0A6E75),
                                        ),
                                        tabs: [
                                          Tab(text: "Daily",),
                                          Tab(text: "Weekly",),
                                          Tab(text: "Overall",),
                                        ]),

                                  ),

                                ),
                                SizedBox(height: 10,),
                                Column(
                                  children: [
                                    Text("Daily Leaderboard", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 14, fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat'),),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 20.0)),
                                        Column(
                                          children: [
                                            Container(
                                                width: 30,
                                                height: 15,
                                                child: Text("Rank",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10.0,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 45.0)),
                                        Column(
                                          children: [
                                            Container(
                                                width: 35,
                                                height: 10,
                                                child: Text("Name",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10.0,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 160.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("High Score",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10.0,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

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
                                                child: Text("1",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
                                              padding: EdgeInsets.only(left: 30.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+'getPdfFile/Emma'),


                                              ),


                                            ),
                                            )
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 5.0)),
                                        Column(
                                          children: [
                                            Container(
                                                width: 50,
                                                height: 10,
                                                child: Text("John Doe",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 125.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child:
                                                Text("1023",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),
                                                )
                                            ),

                                          ],),
                                      ],
                                    ),
                                    SizedBox(height: 15.0,),
                                    Row(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 20.0)),
                                        Column(
                                          children: [

                                            Container(
                                                width: 25,
                                                height: 15,
                                                child: Text("2",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
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
                                                width: 50,
                                                height: 10,
                                                child: Text("John Doe",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 125.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child:
                                                Text("956",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),
                                                )
                                            ),

                                          ],),
                                      ],
                                    ),
                                    SizedBox(height: 15.0,),
                                    Row(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 20.0)),
                                        Column(
                                          children: [

                                            Container(
                                                width: 25,
                                                height: 15,
                                                child: Text("3",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
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
                                                width: 50,
                                                height: 10,
                                                child: Text("John Doe",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 125.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child:
                                                Text("874",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),
                                                )
                                            ),

                                          ],),
                                      ],
                                    ),
                                    SizedBox(height: 15.0,),
                                    Row(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 20.0)),
                                        Column(
                                          children: [

                                            Container(
                                                width: 25,
                                                height: 15,
                                                child: Text("4",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
                                              padding: EdgeInsets.only(left: 30.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+'getPdfFile//Kris'),
                                                  )

                                              ),


                                            ),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 5.0)),
                                        Column(
                                          children: [
                                            Container(
                                                width: 50,
                                                height: 10,
                                                child: Text("John Doe",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 125.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child:
                                                Text("764",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),
                                                )
                                            ),

                                          ],),
                                      ],
                                    ),
                                    SizedBox(height: 15.0,),
                                    Row(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 20.0)),
                                        Column(
                                          children: [

                                            Container(
                                                width: 25,
                                                height: 15,
                                                child: Text("5",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 50.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
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
                                                width: 50,
                                                height: 10,
                                                child: Text("John Doe",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 125.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child:
                                                Text("654",style: TextStyle(fontSize: 10.0,color: Colors.white,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),
                                                )
                                            ),

                                          ],),
                                      ],
                                    ),
                                    SizedBox(height: 5.0,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12,right: 12),
                                      child: Divider(thickness: 2,),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Row(
                                      children: [
                                        Padding(padding: EdgeInsets.only(left: 20.0)),
                                        Column(
                                          children: [

                                            Container(
                                                width: 30,
                                                height: 15,
                                                child: Text("17456",style: TextStyle(color: Color(0xffFDAC88),fontSize: 10.0,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],),
                                        Padding(padding: EdgeInsets.only(left: 45.0)),
                                        Column(
                                          children: [
                                            Padding(padding: EdgeInsets.only(left: 10.0),),
                                            Container(
                                              width: 17,
                                              height: 17,
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
                                                child: Text("Anand",style: TextStyle(color: Color(0xffFDAC88),fontSize: 10.0,fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.only(left: 143.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("48",style: TextStyle(fontSize: 10.0,color: Color(0xffFDAC88),fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

                                          ],),
                                      ],
                                    ),
                                    SizedBox(height: 5.0,),


                                  ],
                                ),

                              ],
                            )
                        ),
                      ),
                    ]
                ),
              )
          )

      ),


    );
  }
}