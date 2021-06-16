import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';
import 'MainPage_11.dart';
import 'package:http/http.dart' as http;
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
      home: Screen79(),
    );
  }
}


class Screen79 extends StatefulWidget {
  @override
  _Screen79State createState() => _Screen79State();
}

class _Screen79State extends State<Screen79> {

  String dart;
  List data;
  Future<String> getSuggestCategories() async {
    var token = await FlutterSession().get('token');
    dart = token.toString();
    String url = "http://18.222.73.151/user/suggestquestion/$dart";
    var response = await http.get(Uri.encodeFull(url));

    this.setState(() {
      Map<String, dynamic> extractdata = jsonDecode(response.body);
      data = extractdata["recordset"];
    });
    print(data);
  }

  Color code;
  String crt;

  Widget choice(String index) {
    if (index == "Approved") {
      code = Color(0xff16C5BE);
    } else if (index == "Rejected") {
      code = Color(0xffAB75EB).withOpacity(0.20);
    } else {
      code = Color(0xffAB75EB);
    }
    return Card(
      color: code,
      //margin: EdgeInsets.all(8),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0)
      ),
      child: Container(
        alignment: Alignment.center,
        width: 55,
        height: 18,
        child: Text("${index}", style: TextStyle(fontSize: 5,
          fontWeight: FontWeight.w600,
          color: Color(0xffFFFFFF),
          fontFamily: 'Montserrat',),),
      ),
    );
  }

  Widget correct(String ans,int index){
    if (ans == data[index]["option1"]) {
      crt = "A";
    } else if (ans == data[index]["option2"]) {
      crt = "B";
    } else if (ans == data[index]["option3"]) {
      crt = "C";
    } else {
      crt = "D";
    }
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text("${crt}. ${ans}",
        style: TextStyle(color: Color(0xffFFFFFF),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 8),),
    );

  }

  @override
// ignore: must_call_super
  void initState() {
    this.getSuggestCategories();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff707070),
      body:  Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                fit: BoxFit.cover)),
        child: Container(
          color: Color(0xff3A0080).withOpacity(0.77),
          padding: EdgeInsets.all(14.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
               //   flex:1,
                  child: Container(
                    // padding: const EdgeInsets.only(left:13.0,right: 13,top: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment. spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Column(
                            children:[
                              Flexible(
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

                            ],
                          ),
                        ),
                        Flexible(
                            flex:1,
                            fit:FlexFit.tight,
                            child:Container(

                            )
                        ),
                        Flexible(
                          flex:1,
                          fit:FlexFit.tight,
                          child:  Column(

                            children: [
                              Container(
                                height:53,
                                width:152,
                                child:Card(
                                  color: Color(0xff16C5BE),
                                  //margin: EdgeInsets.all(30.0),
                                  margin: EdgeInsets.all(8),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0)
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 90,
                                      height: 30,
                                      // padding: EdgeInsets.all(10.0),
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Show: All", style: TextStyle(color: Color(0xffFFFFFF),
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8),),
                                            Icon(Icons.keyboard_arrow_down,color: Colors.white,)
                                          ],
                                        ),
                                      ),

                                    ),
                                    // mainAxisAlignment: MainAxisAlignment.start,

                                  ),
                                ),
                              ),


                            ],),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
                  child:
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data == null
                          ? 0
                          : data.length,
                      itemBuilder: (BuildContext context,
                          int index) {
                        return new Align(
                          //alignment: Alignment.topRight ,
                          child: Container(
                            // margin: EdgeInsets.only(top: 10.0),
                            child: Card(
                              color: Color(0xffAB75EB).withOpacity(0.40),
                              //margin: EdgeInsets.all(8),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0)
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                /*width: 341,
                            height: 181,*/
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      /*  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,*/
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "C:", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 8),),
                                        ),
                                        // SizedBox(width: 20,),
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            data[index]["userCategory"], style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 8),),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                        Container(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "Q:", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 8),),
                                        ),
                                        //  SizedBox(width: 20,),
                                        Container(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            data[index]["userQuestion"],
                                            style: TextStyle(color: Color(0xffFFFFFF),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 8),),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        // SizedBox(width: 30,),
                                        Container(
                                          height: 25,
                                          width: 150,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("A. "+data[index]["option1"],
                                            style: TextStyle(color: Color(0xffFFFFFF),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 7),),
                                        ),

                                        //SizedBox(width: 92,),
                                        Container(
                                          height: 25,
                                          width: 150,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("B. "+data[index]["option2"],
                                            style: TextStyle(color: Color(0xffFFFFFF),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 7),),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // SizedBox(width: 30,),
                                        Container(
                                          height: 25,
                                          width: 150,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("C. "+data[index]["option3"],
                                            style: TextStyle(color: Color(0xffFFFFFF),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 7),),
                                        ),
                                        // SizedBox(width: 65,),
                                        Container(
                                          height: 25,
                                          width: 150,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("A. "+data[index]["option4"],
                                            style: TextStyle(color: Color(0xffFFFFFF),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 7),),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            "A:", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 8),),
                                        ),
                                        //SizedBox(width: 20,),
                                        correct(data[index]["correctAnswer"],index),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        choice(data[index]["Status"]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          ),
                        );
                      }
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
