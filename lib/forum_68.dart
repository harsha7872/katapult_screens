import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:katapult_screens/screen71.dart';

import 'MainPage_11.dart';
import 'PostQuestion_69.dart';
import 'SuggestQA(70).dart';
import 'constants.dart';
//import 'MainPage_11.dart';


class Screen68 extends StatefulWidget {
  @override
  _Screen68State createState() => _Screen68State();
}
class _Screen68State extends State<Screen68> {
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
              color: Color(0xff000877).withOpacity(0.80),
              padding: EdgeInsets.all(10.0),

              child:  Column(
                  children: [
                    SizedBox(height: 10.0,),
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
                                              Icons.arrow_back, size:12,color: Colors.white,)
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
                      flex:10,
                      fit:FlexFit.tight,
                      child: Container(
                       // height: 661,
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

                                  Container(
                                  //  margin: EdgeInsets.all(10.0),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Scarlett Threads:", style: TextStyle(color: Color(0xffFFFFFF),
                                                fontSize: 24,fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),

                                          ],
                                        ),
                                        SizedBox(height:5.0),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start
                                          ,
                                          children: [
                                            Container(
                                                height:134,
                                                //width:308,
                                                child: Image.network(Constant.base_url+"getPdfFile/Group 74",fit: BoxFit.cover,)
                                            ),

                                          ],
                                        ),
                                        SizedBox(height:5.0),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Lorem Epsum set edum",style: TextStyle(color: Color(0xffFFFFFF),
                                                fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                            Icon(Icons.label,color: Color(0xffF2BF4F),)
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.label,color: Color(0xffCCCCCC),size:20),
                                            Icon(Icons.share,color: Color(0xffCCCCCC),size:20) ,
                                            Icon(Icons.comment,color: Color(0xffCCCCCC),size:20)
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // width: 181,
                                            // height: 15,
                                              padding: EdgeInsets.all(5.0),
                                              child: Text("Lorem Epsum set edum ?",style: TextStyle(fontSize: 12.0,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                        ],),
                                      Column(
                                        children: [
                                          Text("38 min ago",style: TextStyle(fontSize: 10.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffCCCCCC)),)
                                        ],
                                      )


                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(5.0),
                                          // height:33,
                                          // width: 309,
                                          child: Text("Lorem Ipsum is simply dummy text of the\nprintingand typesetting industry.",
                                            style: TextStyle(fontSize: 12.0,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),)
                                      ),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.label,color: Color(0xffCCCCCC),size:20),
                                      Icon(Icons.share,color: Color(0xffCCCCCC),size:20) ,
                                      Icon(Icons.comment,color: Color(0xffCCCCCC),size:20)
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:212,
                                        height:21,
                                        // padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Lorem Epsum set edum ?",style: TextStyle(fontSize: 16.0,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)

                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:260,
                                        height:33,
                                        // padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            //   height:19,
                                            //  width: 211,
                                            Text("Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",style: TextStyle(fontSize: 12.0,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),)


                                          ],
                                        ),
                                      ),
                                      SizedBox(height:10),
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Lorem Epsum set edum ?",style: TextStyle(fontSize: 16.0,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)

                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            //   height:19,
                                            //  width: 211,
                                            Text("Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",style: TextStyle(fontSize: 12.0,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),)


                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left:7.0,right: 7.0),
                                    child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // width: 181,
                                            // height: 15,
                                              padding: EdgeInsets.all(5.0),
                                              child: Text("Lorem Epsum set edum ?",style: TextStyle(fontSize: 12.0,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                        ],),
                                      Column(
                                        children: [
                                          Text("38 min ago",style: TextStyle(fontSize: 10.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffCCCCCC)),)
                                        ],
                                      )


                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        //height:33,
                                        // width: 309,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",
                                            style: TextStyle(fontSize: 12.0,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),)
                                      ),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.label,color: Color(0xffCCCCCC),size:20),
                                      Icon(Icons.share,color: Color(0xffCCCCCC),size:20) ,
                                      Icon(Icons.comment,color: Color(0xffCCCCCC),size:20)
                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Flexible(
                      flex:1,
                      fit:FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment. spaceAround,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                height:48,
                                width:103,
                                child: Card(
                                  color: Color(0xffF6C500) ,
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0)
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) => Screen69()
                                         ));*/
                                    },
                                    //margin: EdgeInsets.all(3.0),
                                    //margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                           height: 41,
                                           width: 37,
                                          // padding: EdgeInsets.all(18.0),
                                            child: Image.network(Constant.base_url+"getPdfFile/Ask A Question")
                                          // mainAxisAlignment: MainAxisAlignment.start,

                                        ),
                                        Text("Ask A \nQuestion",style: TextStyle(color: Color(0xff000000),fontSize: 8,
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),)

                                      ],

                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height:48,
                                width:103,
                                child: Card(
                                  color: Color(0xffDFF3FE) ,
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0)
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                     /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                                       builder: (context) => Screen70()
                                       ));*/
                                    },
                                    //margin: EdgeInsets.all(3.0),
                                    //margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          // height: 50,
                                          //  width: 80,
                                          // padding: EdgeInsets.all(18.0),
                                            child: Image.network(Constant.base_url+"getPdfFile/Suggest A Question")
                                          // mainAxisAlignment: MainAxisAlignment.start,

                                        ),
                                        Text("Suggest\n New \nQuestions",style: TextStyle(color: Color(0xff000000),fontSize: 8,
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),)

                                      ],

                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height:48,
                                width:103,
                                child: Card(
                                  color: Color(0xffFFFFFF) ,
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0)
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                    /*  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) => Screen71()
                                      ));*/
                                    },
                                    //margin: EdgeInsets.all(3.0),
                                    //margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          // height: 50,
                                          // width: 80,
                                          // padding: EdgeInsets.all(18.0),
                                            child: Image.network(Constant.base_url+"getPdfFile/Suggest New Category")
                                          // mainAxisAlignment: MainAxisAlignment.start,

                                        ),
                                        Text("Suggest\n New\nCategories",style: TextStyle(color: Color(0xff000000),fontSize: 8,
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),)

                                      ],

                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),





                        ],
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
