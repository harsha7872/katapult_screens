import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/result.dart';

import 'constants.dart';
//import 'MainPage_11.dart';

class Screen32 extends StatefulWidget {
 // int marks;
  int marks,expgain,chips,questionanswered;

  Screen32({Key key,@required this.marks,@required  this.expgain,
    @required  this.chips,@required this.questionanswered}) : super(key: key);
  @override
  _Screen32State createState() => _Screen32State(this.marks,this.expgain,this.chips,this.questionanswered);
}
class _Screen32State extends State<Screen32> {
  int marks,expgain,chips,questionanswered;
  _Screen32State(this.marks,this.expgain,this.chips,this.questionanswered);

  String get message => "           Congratulations,\nyou have reached 1st Milestone";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBB138A),
      body:SingleChildScrollView(
        child: Container(
          //  height:812,
          // width: 375,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child:Container(
            color: Color(0xffBB138A).withOpacity(0.80),
            child:Container(
              margin: EdgeInsets.all(8.0),
              child:Column(
                children: [
                  Card(
                    color: Color(0xff3644BA) ,
                    //margin: EdgeInsets.all(30.0),
                    margin: EdgeInsets.only(right: 260,top: 40.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child: Center(
                      child: Container(
                        //padding: EdgeInsets.all(4.0),
                        child: Column(
                          children:<Widget> [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back,size:12,color: Colors.white,),

                                  onPressed: () {
                                    //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    //    builder: (context) => Screen1()
                                    //));
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
                  SizedBox(height: 20,),
                  Container(
                    height:695 ,
                    width: 341,
                    child:  Card(
                      color: Color(0xffF17EDC).withOpacity(0.40),
                      // margin: EdgeInsets.only(top: 10.0,right: 25.0,left: 25.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                              children: [
                                //score heading
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Current Score:0",style:TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 10))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  Image.network(Constant.base_url+"getPdfFile/eclipse",color: Color(0xff3644BA),),
                                                  Text("K",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontWeight: FontWeight.w700,fontFamily: 'Montserrat')),
                                                ]
                                            ),
                                            Text("1000",style:TextStyle(color:Color(0xffFFFFFF),fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 10))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //image and gk name
                                SizedBox(height: 25,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 50,),
                                    Align(
                                      alignment: Alignment.topCenter  ,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Column(
                                          children: [
                                            Text("        History, \nPolitical History,\n  British Empire", style:
                                            TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Color(0xffFFFFFF),fontSize: 24,),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //success image
                                Column(
                                  children: [
                                    Container(
                                      width: 186,
                                      height: 187,
                                      // padding: EdgeInsets.only(top: 40.0,bottom: 130.0),
                                      child: Image.network(Constant.base_url+"getPdfFile/Milestone"),
                                    ),
                                  ],
                                ),
                                //message
                                SizedBox(height: 25,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        message,
                                        style:
                                        TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 18,),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Align(
                                      alignment: Alignment.topCenter  ,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Column(
                                          children: [
                                            Text("You Win", style:
                                            TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 18,),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Container(
                                              height: 35,
                                              width: 35,
                                              child: Image.network(Constant.base_url+"getPdfFile/eclipse",color: Color(0xff3644BA),)),
                                          Text("K",
                                              style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontWeight: FontWeight.w700,fontFamily: 'Montserrat')),
                                        ]
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter  ,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Column(
                                          children: [
                                            Text("100",  style:
                                            TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xff3644BA),fontSize: 25,),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //question number
                                SizedBox(height: 70,),
                                //button
                                ButtonTheme(
                                  buttonColor: Color(0xffB71570),
                                  minWidth: 217.0,
                                  height: 49.0,

                                  child: RaisedButton(
                                    onPressed: () {

                                    },
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0),
                                    ),
                                    child: Text("Continue Game",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'Montserrat')),

                                  ),
                                ),
                                //Quit
                                SizedBox(height: 5,),
                                Align(
                                  alignment: Alignment.topCenter  ,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                            onTap:(){
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                builder: (context) => Screen3(marks:marks,expgain:expgain,chips:chips,questionanswered:questionanswered),
                                              ));
                                            },
                                            child: Text("Quit", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 13,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'))),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                              ]
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
}


