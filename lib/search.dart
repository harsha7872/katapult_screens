import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:katapult_screens/MainPage_11.dart';
class Search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
  Search();
}
class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
          backgroundColor: Color(0xff000000).withOpacity(0.85),
          body: SingleChildScrollView(
            child: Container(
              height: 812,
              width: 375,
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 50,),
                            Column(
                              children: [
                                InkWell(
                                  child: Text("Cancel Search", style: TextStyle(color: Color(0xffCCCCCC),fontSize: 10,
                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w500,),),
                                  onTap: (){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => Screen1()
                                    ));
                                  },
                                ),

                              ],
                            ),
                          ]
                      )
                  ),
                  Container(
                    height: 39,
                    width: 335,
                    decoration:BoxDecoration(
                      border: Border.all(color:Color(0xff707070)),
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text("Search Topics", style: TextStyle(color: Color(0xffCCCCCC),fontSize: 10,
                              fontFamily: 'Montserrat',fontWeight: FontWeight.w500,),),
                          ],
                        ),
                        SizedBox(width: 180,),
                        Row(
                          children: [
                            IconButton(
                                iconSize: 15.25,
                                icon: Icon(Icons.cancel,color: Color(0xff999999),)
                            )
                          ],
                        ),


                      ],
                    ),
                  ),


                ],
              ),
            ),
          )
      ),
    );
  }
  void moveToLastScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Screen1(),
    ));
  }
}