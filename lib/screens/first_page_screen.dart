import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../signupscreen(5).dart';
import '../loginscreen(6).dart';
import '../util/constant.dart';
import '../util/strings.dart';

class FirstPageScreen extends StatefulWidget {
  @override
  _FirstPageScreenState createState() => _FirstPageScreenState();
}

class _FirstPageScreenState extends State<FirstPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: SizeConfig.heightMultiplier,
      //width:screenWidth ,
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bcImg.png",),
              fit: BoxFit.cover)),
      child:Container(
        padding: const EdgeInsets.only(top:180.0,bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex:2,
              fit:FlexFit.tight,
              child: Container(
                //padding: EdgeInsets.only(top: 200),
               height: 309,
                width:304,
                child: Card(
                //  margin: EdgeInsets.only(top: 8.0),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                  ),
                  child: new Container(

                    padding: EdgeInsets.all(25.0),
                    // padding: EdgeInsets.only(top: 222.0,left: 36.0,bottom: 221.0,right: 35.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Container(
                                height: 8.0.h,
                                width: 15.0.w,
                                child: Card(
                                  color:Color(0xff480090).withOpacity(0.40),

                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0)
                                  ),
                                  child: new Container(
                                    alignment: Alignment.center,
                                    //height: 59,
                                    //width: 59,
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle ,
                                      // color: Color(0xff480090),

                                    ),
                                    child:Text("K",style: TextStyle(color: Color(0xffFFFFFF), fontSize: 30,
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [ Container(
                              height: 4.0.h,
                              width: 32.0.w,
                              child: Text("Katapult",style: TextStyle(color: Color(0xff4C0096), fontSize: 24,
                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                            ),

                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Container(
                                height: 5.0.h,
                                width: 40.0.w,
                                child: Text("Fun, addictive, challenging, online trivia, that has the best of two worlds.",
                                  style: TextStyle(color: Color(0xff000000), fontSize: 11,
                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                              ),
                            ],
                          ),
                        ),


                        SizedBox(height: 40,),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()
                            ));

                          },
                          child: Container(
                            //height: 49,
                            //width: 217,
                            padding: EdgeInsets.symmetric(vertical: 18,horizontal: 60),
                            decoration: BoxDecoration(
                                color: Color(0xffB71570),
                                borderRadius: BorderRadius. circular(10)
                            ),
                            alignment:Alignment.center,

                            child:Text("LOGIN",style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12,fontFamily: 'Montserrat'),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                //  margin: EdgeInsets.all(bottom: 15.0,),
                // padding: EdgeInsets.only (left:4.0.h,right:4.0.h,top: 0.0,bottom: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[

                        new Text(
                          "New to Katapult?",
                          style: new TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat'),
                        ),

                        // SizedBox(height:5,),

                        new GestureDetector(
                          onTap: ()
                          {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => SignupScreen()
                            ));
                          },
                          child: new Text(
                            "SIGNUP",

                            style: new TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat'),
                          ),
                        )
                      ],
                    ),
                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  widMainImg() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w),
      child: Image.asset(Constant.IMG_1, height: 50.0.h),
    );
  }

  widTitle() {
    return Text(Strings.APP_NAME,
        style: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 30.0.sp, color: Colors.black),
        ));
  }

  widDesc() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Text(
          Strings.APP_DESC,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle:
                TextStyle(height: 1.3, fontSize: 13.0.sp, color: Colors.grey),
          ),
        ));
  }
}
