import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/screen48.dart';

import 'constants.dart';

class Screen47 extends StatefulWidget {
  String username;
  String name1;
  String email;
  String matchmode;
  int correct,fifty,multiplier;
  List<String> selectedList = [];
  @override
  _Screen47State createState() => _Screen47State();

  Screen47(this.username,this.selectedList,this.name1,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);
}
class _Screen47State extends State<Screen47> {
  String email;
  int correct,fifty,multiplier;
  String matchmode;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Multiplayer(Constant.single,widget.name1,widget.selectedList,widget.email,correct,fifty,multiplier,matchmode)
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,

            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bcImg.png"),
                    fit: BoxFit.cover)),
            child:Container(
              color: Color(0xff13BBAA).withOpacity(0.80),
              padding: EdgeInsets.all(10.0),
              child:Column(
                  children: [
                    SizedBox(height: 150,),
                    Container(
                        child: Center(

                          child: Column(
                              children: [
                                Container(
                                  /* height: 170,
                                          width: 321,*/
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: widget.selectedList.length,
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.only(top: 10.0),
                                              child: Column(
                                                crossAxisAlignment:CrossAxisAlignment.center,
                                                children: [
                                                  Text(widget.selectedList[index], style:
                                                  TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Color(0xffFFFFFF),fontSize: 24,),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 100,),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        Text("Round 1", style: TextStyle(fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700,color: Color(0xffFFFFFF),fontSize: 50,) ,),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        Text("1 of 5", style: TextStyle(fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 18,) ,),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 100,),
                                Align(
                                  alignment: Alignment.center ,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        Text("Game starts in ....3", style: TextStyle(fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 14,) ,),
                                      ],
                                    ),
                                  ),
                                ),
                              ]

                          ),
                        )
                    ),
                  ]
              ),

            ),
          ),
        ),
      ),
    );
  }
}


