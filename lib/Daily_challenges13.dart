import 'dart:convert';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/search.dart';
import 'Leaderboard(57).dart';
import 'MainPage_11.dart';
import 'Marketplace.dart';
import 'Profile(15).dart';
import 'Screen14_Notifications.dart';
import 'Screen42.dart';
import 'Social(67).dart';
import 'constants.dart';

// ignore: must_be_immutable
class Screen13 extends StatefulWidget {
  String username;
  @override
  _Screen13State createState() => _Screen13State();
  Screen13(this.username);
}

class _Screen13State extends State<Screen13> {
  bool _history;
  int counter = 0;
  bool selected = false;
  var userStatus = List<bool>();
  String url =Constant.base_url+"/daily";
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
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        backgroundColor: Color(0xffFF6B57),
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
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child: Container(
              color: Color(0xffFF6B57).withOpacity(0.80),
              padding: EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                     SizedBox(height: 5.0,),
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
                                          SizedBox(width: 5.0,),
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
                      flex: 8,
                      fit: FlexFit.tight,
                      child: SingleChildScrollView(
                        child: Card(
                          color: Color(0xffF5968D).withOpacity(0.50),
                          //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),

                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  right: 12, top: 10, left: 0),
                              child: Center(

                                child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 595,
                                          width: 341,
                                          margin: EdgeInsets.all(2.0),
                                          child: Column(
                                            children: [
                                              Text("Daily Challenges",
                                                style: TextStyle(
                                                    color: Color(0xffFFFFFF),
                                                    fontSize: 24,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight
                                                        .w700),),
                                              //SizedBox(height: 10.0,),
                                              ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: data == null
                                                    ? 0
                                                    : data.length,
                                                itemBuilder: (
                                                    BuildContext context,
                                                    int index) {
                                                  return new Container(
                                                    child: new Center(
                                                      child: new Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceBetween,
                                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Column(
                                                            children: [

                                                              Theme(
                                                                data: ThemeData(
                                                                  unselectedWidgetColor:
                                                                  Color(
                                                                      0xffCCCCCC),),
                                                                child: Transform
                                                                    .scale(
                                                                  scale: 0.4,

                                                                  child: CircularCheckBox(
                                                                      activeColor: Color(
                                                                          0xffCCCCCC),

                                                                      value: true,
                                                                      onChanged: (
                                                                          bool value) {
                                                                        print(
                                                                            value);
                                                                        setState(() {
                                                                          _history =
                                                                              value;
                                                                        });
                                                                      }
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                                              Container(
                                                                  width: 125,
                                                                  height: 10,
                                                                  child: Text(
                                                                    data[index]['challenges'],
                                                                    style: TextStyle(
                                                                        fontSize: 8.0,
                                                                        color: Color(
                                                                            0xffFFFFFF),
                                                                        fontFamily: 'Montserrat',
                                                                        fontWeight: FontWeight
                                                                            .w600),)),
                                                            ],),
                                                          Column(
                                                            children: [
                                                              Container(
                                                                  width: 25,
                                                                  height: 10,
                                                                  child: Text(
                                                                    data[index]['points'],
                                                                    style: TextStyle(
                                                                        fontSize: 8.0,
                                                                        color: Color(
                                                                            0xffFFFFFF),
                                                                        fontFamily: 'Montserrat',
                                                                        fontWeight: FontWeight
                                                                            .w600),)),
                                                            ],),
                                                          Column(
                                                            children: [
                                                              Container(
                                                                width: 38,
                                                                height: 18,
                                                                child: RaisedButton(
                                                                    padding: EdgeInsets
                                                                        .zero,
                                                                    color: Color(
                                                                        0xff1B9AE7),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: new BorderRadius
                                                                            .circular(
                                                                            100.0)
                                                                    ),
                                                                    child: Text(
                                                                      "complete",
                                                                      style: TextStyle(
                                                                          fontSize: 5.0,
                                                                          color: Color(
                                                                              0xffFFFFFF),
                                                                          fontFamily: 'Montserrat',
                                                                          fontWeight: FontWeight
                                                                              .w600),),
                                                                    onPressed: () {
                                                                    }
                                                                ),
                                                              ),
                                                            ],),

                                                          SizedBox(width: 4,),
                                                          Column(
                                                            children: [
                                                              Container(

                                                                width: 55,
                                                                height: 18,
                                                                child: RaisedButton(
                                                                    padding: EdgeInsets
                                                                        .zero,
                                                                    color: Color(
                                                                        0xffCCCCCC),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: new BorderRadius
                                                                            .circular(
                                                                            100.0)
                                                                    ),
                                                                    child: Text(
                                                                      "Collect VVD coins",
                                                                      style: TextStyle(
                                                                          fontSize: 5.0,
                                                                          color: Color(
                                                                              0xff3644BA),
                                                                          fontFamily: 'Montserrat',
                                                                          fontWeight: FontWeight
                                                                              .w600),),
                                                                    onPressed: () {}
                                                                ),
                                                              ),
                                                            ],),
                                                          // SizedBox(height: 35.0,),
                                                        ],
                                                      ),

                                                    ),
                                                  );
                                                },
                                              ),


                                            ],
                                          ),
                                        ),
                                      ),

                                    ]
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //SizedBox(height: 5.0,),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        width: 900,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[

                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Container(
                                height: 48,
                                width: 83,
                                child: Card(
                                  color: Color(0xffFFFFFF),
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          5.0)
                                  ),
                                  //  margin: EdgeInsets.all(3.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Screen13(widget.username)
                                          ));
                                    },
                                    child: Center(
                                      child: Image.network(
                                          Constant.base_url +
                                              "getPdfFile/Daily",
                                          fit: BoxFit.cover),
                                      // mainAxisAlignment: MainAxisAlignment.start,


                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                height: 48,
                                width: 83,
                                child: Card(
                                  color: Color(0xff15B1F1),
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          5.0)
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Screen57(widget.username)
                                          ));
                                    },
                                    //margin: EdgeInsets.all(3.0),
                                    //margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                    child: Center(
                                      child: Container(

                                        // padding: EdgeInsets.all(18.0),
                                        child: Image.network(
                                            Constant.base_url +
                                                "getPdfFile/Group 74",
                                            fit: BoxFit.cover),
                                        // mainAxisAlignment: MainAxisAlignment.start,

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Container(
                                height: 48,
                                width: 83,
                                child: Card(
                                  color: Color(0xffFF6A56),
                                  //margin: EdgeInsets.only(right: 300,),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          5.0)
                                  ),

                                  // margin: EdgeInsets.all(3.0),
                                  //    margin: EdgeInsets.only(top: 5.0, bottom: 4.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Screen67(widget.username)
                                          ));
                                    },
                                    child: Center(
                                      child: Image.network(
                                          Constant.base_url +
                                              "getPdfFile/Group 99",
                                          fit: BoxFit.cover),
                                      // mainAxisAlignment: MainAxisAlignment.start,

                                    ),

                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                  height: 48,
                                  width: 83,
                                  child: Card(
                                    color: Color(0xff490092),
                                    //margin: EdgeInsets.only(right: 300,),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(
                                            5.0)
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Screen62(widget.username)
                                            ));
                                      },
                                      //margin: EdgeInsets.all(5),
                                      // margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                      child: Center(
                                        child: Image.network(
                                            Constant.base_url +
                                                "getPdfFile/Group 100",
                                            fit: BoxFit.cover),
                                        // mainAxisAlignment: MainAxisAlignment.start,

                                      ),
                                    ),
                                  )
                              ),
                            ),


                          ],
                        ),
                      ), //Container
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