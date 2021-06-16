import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';
import 'FriendProfile(73).dart';
import 'MainPage_11.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
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
      home: Screen78(),
    );
  }
}

class Screen78 extends StatefulWidget {
  @override
  _Screen78State createState() => _Screen78State();
}

class _Screen78State extends State<Screen78> {
  String dart;
  List data;


  Color colortoshow;
  Color approve = Color(0xff16C5BE);
  Color reject = Color(0xffAB75EB).withOpacity(0.20);
  Color pending = Color(0xffAB75EB);

  Future<String> getSuggestCategories() async {
    var token = await FlutterSession().get('token');
    dart = token.toString();
    String url = "http://18.222.73.151/user/suggestcategory/$dart";
    var response = await http.get(Uri.encodeFull(url));

    this.setState(() {
      Map<String, dynamic> extractdata = jsonDecode(response.body);
      data = extractdata["recordset"];
    });
  }


  @override
// ignore: must_call_super
  void initState() {
    this.getSuggestCategories();
  }

  Color code;


  Widget choice(String index) {
    if (index == "Approved") {
      code = Color(0xff16C5BE);
    } else if (index == "Rejected") {
      code = Color(0xffAB75EB).withOpacity(0.20);
    } else {
      code = Color(0xffAB75EB);
    }
    return RaisedButton(
        padding: EdgeInsets.zero,
        color: code,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(100.0)
        ),
        child: Text(
          "${index}", style: TextStyle(fontSize: 5.0, color: Color(0xffFFFFFF),
            fontFamily: 'Montserrat', fontWeight: FontWeight.w600),),
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Screen73(data[0]["FRIEND_EMAIL"],data[0]["FRIEND_NAME"]),
          ));
        }
    );
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
                              flex:2,
                              fit:FlexFit.tight,
                              child:Container(

                              )
                          ),
                          Flexible(
                              flex:3,
                              fit:FlexFit.tight,
                              child: Container(
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            color: Color(0xff16C5BE),
                                            //margin: EdgeInsets.all(30.0),
                                            //  margin: EdgeInsets.only(right: 50,top: 10.0),
                                            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius
                                                    .circular(
                                                    10.0)
                                            ),
                                            child: Center(
                                              child: Container(
                                               /* width: 90,
                                                height: 30,*/
                                                padding: EdgeInsets.all(5.0),
                                                child:
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    Text(
                                                      "Show: All", style: TextStyle(
                                                        color: Color(0xffFFFFFF),
                                                        fontSize: 8,
                                                        fontFamily: 'Montserrat',
                                                        fontWeight: FontWeight
                                                            .w700),),
                                                    Icon(Icons.keyboard_arrow_down,
                                                      color: Color(0xffFFFFFF),)
                                                  ],
                                                ),

                                              ),
                                              // mainAxisAlignment: MainAxisAlignment.start,

                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          Column(
                                            children: [
                                              Image.network(Constant.base_url +
                                                  "getPdfFile/Search")
                                            ],
                                          )
                                        ],
                                      )

                                    ],
                                  ),

                              )
                          )
                        ],
                      ),
                    ),
                   /* Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        // height: 56,
                        //   width:82,
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Card(
                                  color: Color(0xffAB75EB),
                                  //margin: EdgeInsets.all(30.0),
                                  //  margin: EdgeInsets.only(right: 50,top: 10.0),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          10.0)
                                  ),
                                  child: Center(
                                    child: Container(
                                      //padding: EdgeInsets.all(5.0),
                                      child:
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Screen1(),
                                                  ));
                                            },
                                            icon: Icon(Icons.arrow_back,
                                                color: Colors.white,size:12),
                                          ),
                                          SizedBox(width: 5.0,),
                                          Icon(Icons.home, color: Colors.white,)
                                        ],
                                      ),

                                    ),
                                    // mainAxisAlignment: MainAxisAlignment.start,

                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      color: Color(0xff16C5BE),
                                      //margin: EdgeInsets.all(30.0),
                                      //  margin: EdgeInsets.only(right: 50,top: 10.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius
                                              .circular(
                                              10.0)
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: 90,
                                          height: 30,
                                          padding: EdgeInsets.all(5.0),
                                          child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              Text(
                                                "Show: All", style: TextStyle(
                                                  color: Color(0xffFFFFFF),
                                                  fontSize: 8,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight
                                                      .w700),),
                                              Icon(Icons.keyboard_arrow_down,
                                                color: Color(0xffFFFFFF),)
                                            ],
                                          ),

                                        ),
                                        // mainAxisAlignment: MainAxisAlignment.start,

                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Column(
                                      children: [
                                        Image.network(Constant.base_url +
                                            "getPdfFile/Search")
                                      ],
                                    )
                                  ],
                                )

                              ],
                            ),
                            // SizedBox(width:20.0),


                          ],
                        ),
                      ),
                    ),*/
                    SizedBox(height: 10.0,),
                    Flexible(
                      flex: 9,
                      fit:FlexFit.tight,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text("Categories", style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700),),
                                      Text("Status", style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 18,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700),),

                                    ],
                                  ),
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
                                                                child: Text(
                                                                  data[index]["userCategory"],
                                                                  style: TextStyle(
                                                                      fontSize: 8.0,
                                                                      fontFamily: 'Montserrat',
                                                                      fontWeight: FontWeight
                                                                          .w600,
                                                                      color: Color(
                                                                          0xffFFFFFF)),)),
                                                          ],),
                                                        Column(
                                                          children: [
                                                            Container(
                                                                width: 55,
                                                                height: 18,
                                                                child: choice(
                                                                    data[index]["Status"])
                                                            ),
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

