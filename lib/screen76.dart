import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

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
      home: Screen76(),
    );
  }
}


class Screen76 extends StatefulWidget {
  @override
  _Screen76State createState() => _Screen76State();
}

class _Screen76State extends State<Screen76> {
  TextEditingController _category= new TextEditingController();
  String _ques;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff707070),
      body: SingleChildScrollView(
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
            padding: const EdgeInsets.only(top: 10),
            child:  Column(
                  children: [
                    Flexible(
                      //   flex:1,
                      child: Container(
                        // padding: const EdgeInsets.only(left:13.0,right: 13,top: 0.0),
                        child: Row(
                         /* mainAxisAlignment: MainAxisAlignment. spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,*/
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Column(
                                children:[
                                  Flexible(
                                    child: Card(
                                      color: Color(0xffAB75EB),
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

                                ],
                              ),
                            ),
                            Flexible(
                                flex:3,
                                fit:FlexFit.tight,
                                child:Container(

                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                    Align(
                      //alignment: Alignment.topRight ,
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Card(
                          color: Color(0xffAB75EB).withOpacity(0.40),
                          //margin: EdgeInsets.all(8),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 341,
                            height: 146,
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
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                    SizedBox(width: 150,),
                                    Text("B. Nov 28", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    SizedBox(width: 30,),
                                    Text("C. May 2", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                    SizedBox(width: 150,),
                                    Text("D. Sep 22", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
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
                        margin: EdgeInsets.only(top: 10.0),
                        child: Card(
                          color: Color(0xffAB75EB).withOpacity(0.40),
                          //margin: EdgeInsets.all(8),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 341,
                            height: 179,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("C:", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                    SizedBox(width: 20,),
                                    Text("Indian History", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text("Q:", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                    SizedBox(width: 20,),
                                    Text("During What time period below marble mausoleum is built.", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                    children: [
                                      SizedBox(width: 20,),
                                      Card(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(10.0)
                                        ),
                                        child: Container(
                                          width: 132,
                                          height: 68,
                                          child: Image.network(Constant.base_url+"getPdfFile/download",fit:BoxFit.fill ,),
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Column(
                                        children: [
                                          Text("A. 1632-53 ", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                          SizedBox(height: 10,),
                                          Text("B. 1632-43", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                          SizedBox(height: 10,),
                                          Text("C. 1632-53 ", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                          SizedBox(height: 10,),
                                          Text(" D. 1632-63", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),



                                        ],
                                      )

                                    ]                              ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text("A:", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                    SizedBox(width: 20,),
                                    Text("A. 1632-53", style: TextStyle(color: Color(0xffFFFFFF),
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
                        margin: EdgeInsets.only(top: 10.0),
                        child: Card(
                          color: Color(0xffAB75EB).withOpacity(0.40),
                          //margin: EdgeInsets.all(8),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 341,
                            height: 146,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("C:", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                    SizedBox(width: 20,),
                                    Text("Asia", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text("Q:", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                    SizedBox(width: 20,),
                                    Text("The language of Lakshadweep. a Union Territory of India, is", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    SizedBox(width: 30,),
                                    Text("A. Tamil", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                    SizedBox(width: 150,),
                                    Text("B. Hindi", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    SizedBox(width: 30,),
                                    Text("C. Malayalam", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                    SizedBox(width: 132,),
                                    Text("D. Telugu", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text("A:", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                    SizedBox(width: 20,),
                                    Text("C. Malayalam", style: TextStyle(color: Color(0xffFFFFFF),
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
                        margin: EdgeInsets.only(top: 10.0),
                        child: Card(
                          color: Color(0xffAB75EB).withOpacity(0.40),
                          //margin: EdgeInsets.all(8),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 341,
                            height: 146,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("C:", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                    SizedBox(width: 20,),
                                    Text("Books", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text("Q:", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                    SizedBox(width: 20,),
                                    Text("Who is the author of the book 'Amrit Ki Ore'?", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    SizedBox(width: 30,),
                                    Text("A. Mukesh Kumar", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                    SizedBox(width: 115,),
                                    Text("B. Narendra Mohan", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    SizedBox(width: 30,),
                                    Text("C. Upendra Nath", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                    SizedBox(width: 120,),
                                    Text("D. Nirad C. Choudhary", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w500,fontSize: 7),),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Text("A:", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                    SizedBox(width: 20,),
                                    Text("B. Narendra Mohan", style: TextStyle(color: Color(0xffFFFFFF),
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ),
                      ),
                    ),




                  ]

              ),

          ),
        ),
      ),




    );
  }
}
