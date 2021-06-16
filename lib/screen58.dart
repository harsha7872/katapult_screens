import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'MainPage_11.dart';
import 'constants.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Generated App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  Screen58(),
    );
  }
}

class Screen58 extends StatefulWidget {
  Screen58({Key key}) : super(key: key);
  @override
  _Screen58State createState() => new _Screen58State();
}

class _Screen58State extends State<Screen58> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:SingleChildScrollView(
          child: Container(decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
              child:  Container(
                height: 800,
                color: Color(0xff354FC3).withOpacity(0.80),
                child: Column(
                    children: <Widget>[
                      //card is used to naviagte to home screen
                      Card(
                        color: Color(0xff5095E4)  ,
                        //margin: EdgeInsets.all(30.0),
                        margin: EdgeInsets.only(right: 250,top: 10.0,left:20.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Center(
                          child: Container(
                            // padding: EdgeInsets.all(10.0),
                            child: Column(
                              children:<Widget> [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.arrow_back,color: Colors.white,size: 15,),

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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //shows the topic which is choosed by the user
                          Padding(
                            padding: EdgeInsets.only(top:25.0,bottom: 10),
                            child: Text("Leaderboards",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat'),),
                          ),

                        ],
                      ),
                      Card(
                        color: Color(0xff5095E4).withOpacity(0.40),
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
                                    padding: EdgeInsets.all(20.0),
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text("Overall Leaderboard",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat'),)
                                          ],
                                        ),
                                        Column(children:[
                                          Card(
                                            color: Color(0xff323FB0),
                                            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(10.0),
                                                side: BorderSide(color: Color(0xff5095E4))
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

                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Card(
                                          color: Color(0xff5095E4),
                                          //margin: EdgeInsets.all(30.0),
                                          margin: EdgeInsets.only(left: 15,right: 15),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(5.0),
                                              side: BorderSide(color: Color(0xff323FB0))
                                          ),
                                          child: Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 142,
                                              height: 32,
                                              // padding: EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        Card(
                                          color: Color(0xff5095E4),
                                          //margin: EdgeInsets.all(30.0),
                                        //  margin: EdgeInsets.only(left: 15,right: 15),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(5.0),
                                              side: BorderSide(color: Color(0xff323FB0))
                                          ),
                                          child: Center(
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 130,
                                              height: 32,
                                              // padding: EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [

                                                  Text("Country: All", style: TextStyle(color: Color(0xffFFFFFF),
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                                  IconButton(
                                                    icon: Icon(Icons.keyboard_arrow_down,color: Color(0xffFFFFFF),size: 12,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                                        Padding(padding: EdgeInsets.only(left: 120.0,right: 0.0)),
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
                                        Padding(padding: EdgeInsets.only(left: 80.0,right: 8.0)),
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
                                        Padding(padding: EdgeInsets.only(left: 80.0,right: 8.0)),
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
                                        Padding(padding: EdgeInsets.only(left: 80.0,right: 8.0)),
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
                                                    image: NetworkImage(Constant.base_url+'getPdfFile/Kris'),
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
                                        Padding(padding: EdgeInsets.only(left: 80.0,right: 8.0)),
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
                                        Padding(padding: EdgeInsets.only(left: 80.0,right: 8.0)),
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
                                        Padding(padding: EdgeInsets.only(left: 95.0,right: 8.0)),
                                        Column(
                                          children: [
                                            Container(
                                                child: Text("48",style: TextStyle(fontSize: 10.0,color: Color(0xffFDAC88),fontWeight: FontWeight.w600,
                                                    fontFamily: 'Montserrat'),)),

                                          ],),
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),


                                  ],
                                ),

                              ],
                            )
                        ),
                      ),
                      Card(
                        color: Color(0xff5095E4).withOpacity(0.40),
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),

                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: 341,
                            height: 59,
                            // padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text("Daily Leaderboard", style: TextStyle(color: Color(0xffFFFFFF),
                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 18),),
                                IconButton(
                                  icon: Icon(Icons.keyboard_arrow_down,color: Color(0xffFFFFFF),size: 15,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Color(0xff5095E4).withOpacity(0.40),
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),

                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: 341,
                            height: 59,
                            // padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text("Weekly Leaderboard", style: TextStyle(color: Color(0xffFFFFFF),
                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 18),),
                                IconButton(
                                  icon: Icon(Icons.keyboard_arrow_down,color: Color(0xffFFFFFF),size: 15,),
                                ),
                              ],
                            ),
                          ),
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