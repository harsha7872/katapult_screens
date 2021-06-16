import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/search.dart';

import 'MainPage_11.dart';
import 'MultiplayerCategories_37.dart';
import 'constants.dart';

class Screen36 extends StatefulWidget {
  String username;
  String matchmode;
  String email;
  int correct,fifty,multiplier;
  @override
  _Screen36State createState() => _Screen36State();
  Screen36(this.username,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);
}

class _Screen36State extends State<Screen36> {
  String requestmode;
  List<String> requestcategory= [];
String email;
int correct,fifty,multiplier;
String matchmode;

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(

      backgroundColor: Color(0xff13BBAA) ,
      body:SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child:Container(
              color: Color(0xff13BBAA).withOpacity(0.80),
              padding: EdgeInsets.all(10.0),
              child:  Column(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            padding: EdgeInsets.only(
                                                top: 30.0, bottom: 100.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      Constant.base_url+"getPdfFile/anand"),
                                                )

                                            ),

                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text("Hi ${widget.username},",
                                            style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontSize: 18,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600),),
                                          SizedBox(height:5.0),
                                          Text("Its time to play!",
                                            style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontSize: 10,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                      SizedBox(width: 40.0),
                                      Column(
                                        children: [
                                          Image.network(Constant.base_url+"getPdfFile/Message")
                                        ],
                                      ),
                                      SizedBox(width:0.0),
                                      Column(
                                        children: [

                                          GestureDetector(
                                              onTap:(){
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                    builder: (context) => Search()
                                                ));
                                              },
                                              child:  Image.network(Constant.base_url+"getPdfFile/Search"))
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ), //Container
                      ),
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
                      Flexible(
                        flex: 8,
                        fit: FlexFit.tight,
                        child:Container(
                        height: 540,
                        width: 400,
                        child: Card(
                          color: Color(0xff99CFD6).withOpacity(0.40),
                          //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),
                          child: Center(

                            child: Column(
                                children: [
                                  SizedBox(height: 30,),
                                  Align(
                                    alignment: Alignment.topCenter  ,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        children: [
                                          Text("Select Match Mode", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 178,
                                    width: 231,
                                    child: Card(
                                      color: Color(0xffD6E2FB).withOpacity(0.40),
                                      elevation: 10.0,
                                      //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular (10.0)
                                      ),
                                      child:InkWell(
                                        onTap: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              builder: (context) => Screen37(widget.username,widget.email,widget.correct,widget.fifty,widget.multiplier,matchmode)
                                          ));
                                        },
                                        child: new Container(
                                          padding: EdgeInsets.all(20.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Column(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children:[

                                                Image.network(Constant.base_url+"getPdfFile/Live Mode"),
                                                Text( "Live Mode",style: TextStyle(color: Color(0xff3844BD),
                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w700, fontSize: 24),),

                                              ],
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    height:178,
                                    width: 231,
                                    child: Card(
                                      color: Color(0xffD6E2FB).withOpacity(0.40),
                                      elevation: 10.0,
                                      //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular (10.0)
                                      ),
                                      child: new Container(
                                    padding: EdgeInsets.all(1.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children:[
                                              Image.network(Constant.base_url+"getPdfFile/Turn Based Mode"),
                                              Text( "Turn Based Mode",style: TextStyle(color: Color(0xff3844BD),
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 24),),

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
              ),

                    ]

                ),

            ),


          )
      ),
    );
  }
}


