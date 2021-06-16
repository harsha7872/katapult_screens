import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:katapult_screens/size_config.dart';
import 'MainPage_11.dart';
import 'constants.dart';
import 'screen_23.dart';
import 'package:http/http.dart' as http;

class Screen22 extends StatefulWidget {
  List<String> selectedList = [];
  String single;
  String username;
  String name1;
  int correct,fifty,multiplier;
  @override
  _Screen22State createState() => _Screen22State(this.selectedList,this.username,this.name1,this.correct,this.fifty,this.multiplier);
  Screen22(this.selectedList,this.username,this.name1,this.correct,this.fifty,this.multiplier);
}

class _Screen22State extends State<Screen22> {
  List<String> selectedList = [];
  String name1;
  String username;
  int correct,fifty,multiplier;
  String single;
  Object get height1 => MediaQuery.of(context).size.height;
  Object get width1 => MediaQuery.of(context).size.width;
  String email;
  _Screen22State(this.selectedList,this.username,this.name1,this.correct,this.fifty,this.multiplier);
  @override
  void initState() {
    super.initState();
    makRequest();
  }
  List rewards;
  Future<String> makRequest() async{
    var token = await FlutterSession().get('token')  ;

    email = token.toString();

    String url =Constant.base_url+"rewards/$email";
    var response = await http.get(Uri.encodeFull(url));
    setState(() {
      Map<String, dynamic> extractdata = jsonDecode(response.body);
      rewards = extractdata["recordset"];
    });
    print(rewards);
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(

        backgroundColor: Color(0xffBB138A),
        body:SingleChildScrollView(
          child: Container(
            height: height1,
            width: screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child:Container(
              color: Color(0xffBB138A).withOpacity(0.80),
              padding: EdgeInsets.all(15.0),

              child:Column(
                children: [
                  SizedBox(height: 20,),
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
                  SizedBox(height: 20,),
                  Flexible(
                    flex:7,
                    child: Container(
                      //   height: (445/SizeConfig.heightMultiplier)*SizeConfig.heightMultiplier,
                      //  width:(341/SizeConfig.widthMultiplier)*SizeConfig.widthMultiplier,
                      child: Card(
                        color: Color(0xffF17EDC).withOpacity(0.40),
                        // margin: EdgeInsets.only(top: 10.0,bottom: 150.0,right: 25.0,left: 25.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Center(
                          child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text("Current Score: 0",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                          color: Color(0xffFFFFFF),fontSize: 10, ),),
                                      ],
                                    ),
                                    SizedBox(width: 150,),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  Image.network(Constant.base_url+"getPdfFile/ellipse6",height: 17,width: 17,),
                                                  Text("K",style: TextStyle(color:Color(0xffFFFFFF),
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 12),),
                                                ]
                                            ),
                                            SizedBox(width: 5,),
                                            Text("1000",style: TextStyle(fontSize: 12.0,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                          ],),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30,),
                                 Container(
                                      height: 170,
                                      width: 321,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: widget.selectedList.length,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                SizedBox(height: 100,),
                                Align(
                                  alignment: Alignment.topCenter  ,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        Text("Question 1", style: TextStyle(fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 18,),),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20,),
                                ButtonTheme(
                                  buttonColor: Color(0xffB71570),
                                  minWidth: 217.0,
                                  height: 49.0,

                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => screen4(Constant.single,widget.name1,widget.selectedList,widget.correct,widget.fifty,widget.multiplier),
                                     ));
                                    },
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0),
                                    ),
                                    child: Text("Start Game".toUpperCase(),style:TextStyle(fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),

                                  ),
                                ),
                                SizedBox(height: 10,),
                                Align(
                                  alignment: Alignment.center ,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        Text("Quit", style: TextStyle(fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 13,),),
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
                  Flexible(
                      flex:2,
                      child:Container(

                      )
                  )

                ],
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


