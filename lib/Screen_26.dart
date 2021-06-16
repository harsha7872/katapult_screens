
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_admob/flutter_admob.dart';

import '26popup.dart';
import '26popup_content.dart';
import 'constants.dart';
class Screen26 extends StatefulWidget {
  final int datas;
  Screen26({Key key, @required this.datas}) : super(key: key);
  @override
  _Screen26State createState() => _Screen26State(datas);
}

class _Screen26State extends State<Screen26> {

  final int datas;

  _Screen26State(this.datas);

  String dart = 'bhar1@gmail.com';


  int resume = 45;


  @override
  void initState() {
    super.initState();
  }


  Future<void> showAdMob() async {
    await FlutterAdmob.init("ca-app-pub-1835997340427353~7906592133").then((_) {
      FlutterAdmob.showRewardVideo("ca-app-pub-1835997340427353/1341183784",);
      // FlutterAdmob.showRewardVideo("ca-app-pub-3940256099942544/1712485313");
    });
  }

  void displayDialog(context, title, text) =>
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
                title: Text(title),
                content: Text(text)
            ),
      );

  checkAvailability() {
    if (resume <= datas) {
      return userReward(dart, resume.toString());
    } else {
      displayDialog(context, "Insufficient Coins",
          "Sorry you doesn't have sufficient coins.");
    }
  }

  Future<void> userReward(String email, String userChips) async {
    final response = await http.post(
        Constant.base_url + 'userResume', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': email,
      'userChips': userChips,

    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        /* return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>Screen11()));*/
      }
      else if (response.statusCode == 402) {
        print(response.body);
        displayDialog(context, "Insufficient Coins",
            "Sorry you doesn't have sufficient coins.");
      }
      else {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    showPopup(BuildContext context, Widget widget, String title,
        {BuildContext popupContext}) {
      Navigator.push(
        context,
        PopupLayout(
          top: 30,
          left: 30,
          right: 30,
          bottom: 50,
          child: PopupContent(
            content: Scaffold(
              backgroundColor: Color(0xffBB138A),
              resizeToAvoidBottomInset: false,
              body: widget,
            ),
          ),
        ),
      );
    }
    Widget _popupBody() {
      SingleChildScrollView(
        child: Container(
          height: 812,
          width: 375,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child: Container(
            color: Color(0xffBB138A).withOpacity(0.80),
            child: Container(
              margin: EdgeInsets.all(8.0),

              child: Column(
                children: [

                  SizedBox(height: 50,),
                  Container(
                    height: 604,
                    width: 341,
                    child: Card(
                      color: Color(0xffF17EDC).withOpacity(0.40),
                      // margin: EdgeInsets.only(top: 10.0,bottom: 150.0,right: 25.0,left: 25.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      ),
                      child: Center(

                        child: Column(
                            children: [
                              SizedBox(height: 100,),

                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "        History, \nPolitical History,\n  British Empire",
                                        style:
                                        TextStyle(fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffFFFFFF),
                                          fontSize: 24,),),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 100,),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  // margin: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Text("Total Score: 2", style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFFFFFF),
                                        fontSize: 14,),),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 20,),
                              new Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Container(
                                          //height:41,
                                          width: 118,
                                          child: new RaisedButton(
                                            onPressed: () {
                                              showAdMob();
                                            },
                                            color: Color(0xffE57AC5),
                                            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius
                                                    .circular(10.0),
                                                side: BorderSide(
                                                    color: Color(0xffBE14A0))
                                            ),
                                            child:
                                            new Text(
                                              "Watch Video to Continue",
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                                fontSize: 12,),

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(15.0),
                                          child: new Text(
                                            "OR",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffFFFFFF),
                                              fontSize: 12,),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                          height: 41,
                                          width: 118,
                                          child: new RaisedButton(
                                              onPressed: () {

                                                checkAvailability();
                                              },

                                              color: Color(0xffE57AC5),
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius: new BorderRadius
                                                      .circular(10.0),
                                                  side: BorderSide(
                                                      color: Color(0xffBE14A0))
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  new Text(
                                                    "Use",
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      color: Color(0xffFFFFFF),
                                                      fontSize: 12,),

                                                  ),
                                                  Stack(
                                                      alignment: Alignment
                                                          .center,
                                                      children: <Widget>[
                                                        Image.network(
                                                  Constant.base_url+"getPdfFile/eclipse",
                                                          color: Color(
                                                              0xff3644BA),),
                                                        Text("K",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffFFFFFF),
                                                                fontSize: 12,
                                                                fontWeight: FontWeight
                                                                    .w700,
                                                                fontFamily: 'Montserrat')),
                                                      ]
                                                  ),
                                                  new Text(
                                                    resume.toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      color: Color(0xffFFFFFF),
                                                      fontSize: 12,),

                                                  ),
                                                ],
                                              )

                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  Image.network(
                                        Constant.base_url+"getPdfFile/eclipse",
                                                    color: Color(0xff3644BA),),
                                                  Text("K", style: TextStyle(
                                                      color: Color(0xffFFFFFF),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      fontFamily: 'Montserrat')),
                                                ]
                                            ),
                                            new Text(
                                              datas.toString() + ' Available',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                                fontSize: 12,),

                                            ),
                                          ],
                                        )

                                      ],
                                    )

                                  ]

                              ),
                              SizedBox(height: 150,),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Text("Quit", style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFFFFFF),
                                        fontSize: 13,),),
                                    ],
                                  ),
                                ),
                              ),


                            ]
                        ),

                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
  }


}
