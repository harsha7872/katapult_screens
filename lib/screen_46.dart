import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/screen48.dart';
import 'package:katapult_screens/screen_47.dart';
import 'package:katapult_screens/search.dart';

import 'MainPage_11.dart';
import 'Screen14_Notifications.dart';
import 'constants.dart';


class Screen46 extends StatefulWidget {
  String username;
  String name1;
  String email;
  String matchmode;
  int correct,fifty,multiplier;
  List<String> selectedList = [];
  @override
  _Screen46State createState() => _Screen46State();
  Screen46(this.username,this.selectedList,this.name1,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);
}

class _Screen46State extends State<Screen46> {
  String email;
  String matchmode;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

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
              padding: EdgeInsets.all(5),
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
                      //  SizedBox(height: 5.0,),
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

                      SizedBox(height: 35.0,),
              Flexible(
                flex: 6,
                fit: FlexFit.loose,
                  child:    Container(
                        // height: 476,
                        // width: 341,
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
                                  Container(
                                    height: 355,
                                    width: 341,
                                    child: Align(
                                      alignment: Alignment.center ,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Column(
                                          children: [
                                            SizedBox(height:40.0,),
                                            Text("Initial Ante", style: TextStyle(color: Color(0xffFFFFFF),
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 24,),),
                                            SizedBox(height:30.0),
                                            FlatButton(
                                              minWidth:97,
                                              height: 41,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  side: BorderSide(color: Color(0xff0A6E75))),
                                              color: Color(0xff1AA6B0),
                                              textColor: Color(0xff0A6E75),
                                              padding: const EdgeInsets.only(left: 35,right: 34,top: 17,bottom: 17),
                                              child: Text("50".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xff0A6E75),fontSize: 12, ),),
                                              onPressed: (){},
                                            ),
                                            SizedBox(height:30.0),
                                            Container(
                                              height: 29,
                                              width: 93,
                                              child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),),
                                                onPressed: () {
                                                 Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      builder: (context) => Screen47(Constant.single,widget.selectedList,widget.name1,widget.email,widget.correct,widget.fifty,widget.multiplier,matchmode)
                                                  ));
                                                },
                                                color: Color(0xff0A6E75),
                                                textColor: Colors.white,
                                                child: Text("Start".toUpperCase(),
                                                    style: TextStyle(color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 10),),
                                              ),
                                            ),

                                                    ],),
                                            )


                                  )
                                  ),


                        ]
                      )
              )
              )
                            ),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child:Container()
              )

                ],
                      ),


    ),
    ),
      ),
    );



}

}