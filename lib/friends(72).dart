import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:katapult_screens/FriendProfile(73).dart';
import 'package:http/http.dart' as http;
import 'MainPage_11.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Screen72(),
    );
  }
}

class Screen72 extends StatefulWidget {
  @override
  _Screen72State createState() => _Screen72State();
}

class _Screen72State extends State<Screen72> {
  String requestmode;
  List<String> requestcategory= [];
  String dart;
  List data;

  Future<String> getlist() async {
    var token = await FlutterSession().get('token');
    dart = token.toString();
    String url = "http://18.222.73.151/user/Friends/$dart";
    var response = await http.get(Uri.encodeFull(url));

    this.setState(() {
      Map<String, dynamic> extractdata = jsonDecode(response.body);
      data = extractdata["recordset"];
    });
  }


  @override

// ignore: must_call_super
  void initState(){
    this.getlist();

  }

  // ignore: must_call_super
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return new Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url + "getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child: Container(
            color: Color(0xff3A0080).withOpacity(0.77),
            child: new Center(
              child: const CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url + "getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child: Container(
              color: Color(0xff3A0080).withOpacity(0.77),
              padding: EdgeInsets.all(15.0),

              child:  Column(
                  children: [
                    Flexible(

                      child: Row(
                        children:[
                          Flexible(
                            flex:2 ,
                            fit: FlexFit.loose,
                            child: Card(
                              color: Color(0xffAB75EB),


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
                          ),
                          Flexible(
                              flex:2,
                              fit:FlexFit.tight,
                              child: Container(
                                  child:
                                  Image.network(Constant.base_url+"getPdfFile/Search")

                              )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Flexible(
                      flex:9 ,
                      fit: FlexFit.tight,
                      child: Container(
                        height: 683,
                        width: 341,

                        child: Card(
                          color: Color(0xffAB75EB).withOpacity(0.40),
                          //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Text("Friends", style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700),),
                                  SizedBox(height: 20,),
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: data == null
                                          ? 0
                                          : data.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return new Container(
                                          child: new Center(
                                              child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceBetween,
                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              // width: 134,
                                                              //height: 15,
                                                                padding: EdgeInsets
                                                                    .all(5.0),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment
                                                                      .spaceEvenly,
                                                                  children: [
                                                                    Container(
                                                                        height: 27,
                                                                        width: 27,
                                                                        child: Image
                                                                            .asset(
                                                                            "assets/Ellipse 34.png")),
                                                                    SizedBox(
                                                                      width: 10.0,),
                                                                    Text(
                                                                      data[index]["_FRIEND_NAME"],
                                                                      style: TextStyle(
                                                                          fontSize: 8.0,
                                                                          fontFamily: 'Montserrat',
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color: Color(
                                                                              0xffFFFFFF)),)
                                                                  ],
                                                                )
                                                            ),
                                                          ],),
                                                        Column(
                                                          children: [
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: 55,
                                                                  height: 18,
                                                                  child: RaisedButton(
                                                                      padding: EdgeInsets
                                                                          .zero,
                                                                      color: Color(
                                                                          0xffAB75EB),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: new BorderRadius
                                                                              .circular(
                                                                              100.0)
                                                                      ),
                                                                      child: Text(
                                                                        "View Profile",
                                                                        style: TextStyle(
                                                                            fontSize: 5.0,
                                                                            color: Color(
                                                                                0xffFFFFFF),
                                                                            fontFamily: 'Montserrat',
                                                                            fontWeight: FontWeight
                                                                                .w600),),
                                                                      onPressed: () {
                                                                        Navigator
                                                                            .of(
                                                                            context)
                                                                            .pushReplacement(
                                                                            MaterialPageRoute(
                                                                              builder: (
                                                                                  context) =>
                                                                                  Screen73(data[0]["FRIEND_EMAIL"],data[0]["FRIEND_NAME"]),
                                                                            ));
                                                                      }
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10.0,),
                                                                Column(
                                                                  children: [
                                                                    Card(
                                                                      elevation: 2,
                                                                      shape: new RoundedRectangleBorder(
                                                                        borderRadius: new BorderRadius
                                                                            .circular(
                                                                            50.0),
                                                                        side: BorderSide(
                                                                            color: Color(
                                                                                0xff0D3B9B)),
                                                                      ),
                                                                      child: InkWell(
                                                                        onTap: () {},
                                                                        child: Container(
                                                                            height: 19,
                                                                            width: 19,
                                                                            child: Image
                                                                                .asset(
                                                                                "assets/delete_icon.png")
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            )
                                                          ],),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 7.0, right: 7.0),
                                                      child: Divider(
                                                        thickness: 1.0,
                                                        color: Color(
                                                            0xff5095E4),),
                                                    ),
                                                  ]
                                              )
                                          ),
                                        );
                                      }
                                  ),


                                ],
                              ),
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
      );
    }
  }
}
