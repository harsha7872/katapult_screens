
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/statistics(61).dart';

import 'MainPage_11.dart';
import 'constants.dart';



class Screen60 extends StatefulWidget {
  @override
  _Screen60State createState() => _Screen60State();
}

class _Screen60State extends State<Screen60> {
  bool selected = false;
  var userStatus = List<bool>();

  String url= 'http://52.15.85.29/challenges';


  List data;

  // ignore: missing_return
  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url));

    this.setState(() {
      Map<String, dynamic> extractdata = jsonDecode(response.body);
      data = extractdata["recordset"];
    });
  }
  @override

  // ignore: must_call_super
  void initState(){
    this.makeRequest();

  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(

        //backgroundColor: Color(0xff000877).withOpacity(0.80)  ,
        body:SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),

            //padding: EdgeInsets.all(8.0),
            child:Container(
              color: Color(0xff354FC3).withOpacity(0.80),
              padding: EdgeInsets.all(10.0),
              child:  Column(
                    children: [
                      SizedBox(height: 15.0,),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Row(
                          children:[
                            Flexible(
                              child: Card(
                                color: Color(0xff5095E4) ,

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
                      SizedBox(height: 5.0,),
                      Flexible(
                        flex:13,
                        fit:FlexFit.tight,
                        child: Card(
                          color:Color(0xff5095E4).withOpacity(0.40),
                          //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),

                          child: Center(
                            child: Column(
                                children: [
                                  Container(

                                    margin: EdgeInsets.all(20.0),
                                    child: Column(

                                      mainAxisAlignment: MainAxisAlignment.start ,
                                      children: [
                                        Text("Statistics", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                                        SizedBox(height: 5,),
                                        Card(
                                          color:Color(0xff5095E4).withOpacity(0.40),
                                          //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(10.0)
                                          ),

                                          child: Center(
                                            child: Column(
                                                children: [
                                                  Container(
                                                    height: 42,
                                                    width: 300,
                                                    margin: EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Stack(
                                                                    alignment: Alignment.center,
                                                                    children: <Widget>[
                                                                      Image.asset('assets/eclipse.png'),
                                                                      Text("K",style: TextStyle(color: Color(0xff3644BA),fontSize: 12,fontWeight: FontWeight.w700,fontFamily: 'Montserrat')),
                                                                    ]
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text("  0 ", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                                    Text("  Chips", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                                  ],
                                                                )],
                                                            ),


                                                          ],
                                                        ),
                                                        SizedBox(width:5.0),
                                                        Padding(
                                                          padding: EdgeInsets.only(top:1.0,bottom: 1.0),
                                                          child: VerticalDivider(thickness: 1.0,color: Color(0xff5095E4),),
                                                        ),
                                                        // SizedBox(width:10.0),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                new Icon(Icons.bolt, color: Color(0xffFFFFFF),),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text("  0 ", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                                    Text("  Experience", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                                  ],
                                                                )

                                                              ],

                                                            ),

                                                            //Text("  Experience",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top:1.0,bottom: 1.0),
                                                          child: VerticalDivider(thickness: 1.0,color: Color(0xff5095E4),),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                new Icon(Icons.mail, color: Color(0xffFFFFFF),),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text("  0 ", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                                    Text("  Total Wins", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                                  ],
                                                                ) ],
                                                            ),

                                                            // Text("  Total Wins",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                                          ],
                                                        ),
                                                      ],
                                                    ),








                                                  ),

                                                ]
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Card(
                                          color:Color(0xff5095E4).withOpacity(0.40),
                                          //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius: new BorderRadius.circular(10.0)
                                          ),

                                          child: Center(
                                            child: Column(
                                                children: [
                                                  Container(
                                                    height: 42,
                                                    width: 300,
                                                    margin: EdgeInsets.all(5.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Column(
                                                          ///mainAxisAlignment: MainAxisAlignment.start,
                                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text("         0 \nQuestions Answered", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                          ],

                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top:1.0,bottom: 1.0),
                                                          child: VerticalDivider(thickness: 1.0,color: Color(0xff5095E4),),
                                                        ),
                                                        Column(
                                                          children: [


                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text("          0 \nFriends With", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),



                                                              ],

                                                            ),

                                                            //Text("  Experience",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top:0.0,bottom: 0.0),
                                                          child: VerticalDivider(thickness: 1.0,color: Color(0xff5095E4),),
                                                        ),
                                                        Column(
                                                          children: [

                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("          0\n Matches Played", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                              ],
                                                            ) ],

                                                        ),
                                                      ],
                                                    ),








                                                  ),

                                                ]
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  // width: 134,
                                                  //height: 10,
                                                    child: Text("Badges Won",style: TextStyle(fontSize: 12.0,
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
                                                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                      //));

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
                                        Padding(
                                          padding: EdgeInsets.only(left:7.0,right: 7.0),
                                          child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  // width: 134,
                                                  //height: 10,
                                                    child: Text("Overall Matches Played",style: TextStyle(fontSize: 12.0,
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
                                                       builder: (context) => Screen61(),
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
                                        Padding(
                                          padding: EdgeInsets.only(left:7.0,right: 7.0),
                                          child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  // width: 134,
                                                  //height: 10,
                                                    child: Text("Overall Matches Played Category based",style: TextStyle(fontSize: 12.0,
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
                                                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                      //));

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
                                        Padding(
                                          padding: EdgeInsets.only(left:7.0,right: 7.0),
                                          child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                    width: 89,
                                                    height: 15,
                                                    child: Text("Overall Matches Played Sub-Category based",style: TextStyle(fontSize: 12.0,
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
                                                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                      //));

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
                                        Padding(
                                          padding: EdgeInsets.only(left:7.0,right: 7.0),
                                          child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  // width: 134,
                                                  //height: 10,
                                                    child: Text("Overall Questions Answered",style: TextStyle(fontSize: 12.0,
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
                                                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                      //));

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
                                        Padding(
                                          padding: EdgeInsets.only(left:7.0,right: 7.0),
                                          child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  // width: 134,
                                                  //height: 10,
                                                    child: Text("Overall Questions Attempted",style: TextStyle(fontSize: 12.0,
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
                                                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                      //));

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
                                        Padding(
                                          padding: EdgeInsets.only(left:7.0,right: 7.0),
                                          child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  // width: 134,
                                                  //height: 10,
                                                    child: Text("Overall Experience Gained",style: TextStyle(fontSize: 12.0,
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
                                                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                      //));

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
                                        Padding(
                                          padding: EdgeInsets.only(left:7.0,right: 7.0),
                                          child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  // width: 134,
                                                  //height: 10,
                                                    child: Text("Achievements",style: TextStyle(fontSize: 12.0,
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
                                                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                                      //));

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










                                      ],
                                    ),
                                  ),

                                ]
                            ),
                          ),
                        ),
                      ),




                    ]

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
