import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:katapult_screens/screen76.dart';
import 'package:katapult_screens/screen_79.dart';
import 'CategoriesQA_75.dart';
import 'CategoryStatus_78.dart';
import 'MainPage_11.dart';
import 'constants.dart';




class Screen74 extends StatefulWidget {
  @override
  _Screen74State createState() => _Screen74State();
}

class _Screen74State extends State<Screen74> {

  @override

  // ignore: must_call_super
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
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
              color: Color(0xff3A0080).withOpacity(0.77),
              padding: EdgeInsets.all(10.0),
              child:  Column(
                children: [
                  SizedBox(height: 20.0,),

                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Row(
                      children:[
                        Flexible(
                          child: Card(
                            color: Color(0xffAB75EB) ,
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
                  SizedBox(height: 10.0,),
                  Flexible(
                    flex: 9,
                    fit:FlexFit.tight,
                    child: Container(
                      // height: 683,
                      //width: 341,

                      child: Card(
                        color: Color(0xffAB75EB).withOpacity(0.40),
                        //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text("Library",style: TextStyle(color:Color(0xffFFFFFF),fontSize: 24,fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                                SizedBox(height: 20,),
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
                                            child: Text("All the questions played",style: TextStyle(fontSize: 8.0,
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
                                              /*Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                 builder: (context) => Screen76(),
                                                ));*/

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
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.only(left:7.0,right: 7.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                ),
                                SizedBox(height: 5,),
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
                                            child: Text("Questions Played in Categories",style: TextStyle(fontSize: 8.0,
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
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                builder: (context) => Screen75(),
                                              ));

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
                                SizedBox(height:5,),
                                Padding(
                                  padding: EdgeInsets.only(left:7.0,right: 7.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                ),
                                SizedBox(height: 5,),
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
                                            child: Text("Suggested Questions",style: TextStyle(fontSize: 8.0,
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
                                               Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                builder: (context) => Screen79(),
                                                ));

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
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.only(left:7.0,right: 7.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                ),
                                SizedBox(height: 5,),
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
                                            child: Text("Suggested Categories",style: TextStyle(fontSize: 8.0,
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
                                               Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                  builder: (context) => Screen78(),
                                                ));

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
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.only(left:7.0,right: 7.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                ),


                              ],
                            ),
                          ),
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
  void moveToLastScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Screen1(),
    ));
  }
}

