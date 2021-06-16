//import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'dart:convert';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:katapult_screens/screen_43.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/screen_46.dart';
import 'package:katapult_screens/socketprovider.dart';
import 'package:provider/provider.dart';
import 'MainPage_11.dart';
import 'constants.dart';
import 'package:socket_io_client/socket_io_client.dart';



class Screen42 extends StatefulWidget {
  String username;
  String name1;
  String matchmode;
  String email;
  Socket socket;
  int correct,fifty,multiplier;
  List<String> selectedList = [];
  @override
  _Screen42State createState() => _Screen42State();
  Screen42(this.selectedList,this.username,this.name1,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);
}

class _Screen42State extends State<Screen42 >with TickerProviderStateMixin {
  TabController _controller;
  String _new = 'Invite to Play';
  var room = '1';
  List data;
  String email;
  String matchmode;
  String id;
  // ignore: missing_return

  Future<String> getlist() async {
    var token = await FlutterSession().get('token');
    email = token.toString();
    String url = "http://18.222.73.151/user/Friends/$email";
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
    _controller = new TabController(length: 2, vsync: this);
    //_send();
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  // String email;

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    print(widget.username);
return Consumer<Testing>(

builder: (context,game,child){
  return Scaffold(

    backgroundColor: Colors.blue  ,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:10,),
              //username
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight ,
                        child: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image:DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage("assets/anand.png"),
                                        )

                                    ),

                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hi ${widget.username},", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                  SizedBox(height:5.0),
                                  Text("Its time to play!",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                ],
                              ),
                              SizedBox(width:100.0),
                              Column(
                                children: [
                                  Image.asset("assets/msg.png")
                                ],
                              ),
                              SizedBox(width:0.0),
                              Column(
                                children: [
                                  Image.asset("assets/search.png")
                                ],
                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),//Container
              ),
              SizedBox(height: 5.0,),

              Flexible(
                flex:1,
                child: Container(
                  // padding: const EdgeInsets.only(left:13.0,right: 13,top: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment. spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Column(
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
                                                Icons.arrow_back, color: Colors.white,)
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
                              child: RaisedButton(
                                color: Color(0xff0A6E75),
                                textColor: Color(0xffFFFFFF),
                                // padding: const EdgeInsets.only(left: 35,right: 34,top: 17,bottom: 17),
                                child: Text("start game".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),
                                onPressed: (){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (context) =>Screen46(widget.username,widget.selectedList,widget.name1,widget.email,widget.correct,widget.fifty,widget.multiplier,matchmode),
                                  ));

                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),


                          ],),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.0,),


              Flexible(
                flex:10,
                child:Container(
                  /* height: 720,
                              width: 341,*/
                  child:Card(
                    color: Color(0xff99CFD6).withOpacity(0.40),
                    //margin: EdgeInsets.all(10.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Center(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter  ,
                              child: Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: [
                                    Text("Select Players", style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700 ,fontFamily:'Montserrat',fontSize: 24),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height:5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children:<Widget> [
                                    Row(
                                      children: [
                                        Theme(
                                          data: ThemeData(unselectedWidgetColor:
                                          Colors.white,),
                                          child: Transform.scale(
                                            scale:0.6,

                                            child:CircularCheckBox(
                                                activeColor: Colors.red,

                                                value: false,
                                                onChanged: (bool value) {
                                                  print(value);

                                                  setState(() {
                                                    // _history = value;
                                                  });

                                                }

                                            ),



                                          ),
                                        ),
                                        Text("2 players",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w600 ,fontFamily:'Montserrat',fontSize: 10),)

                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children:<Widget> [
                                    Row(
                                      children: [
                                        Theme(
                                          data: ThemeData(unselectedWidgetColor:
                                          Colors.white,),
                                          child: Transform.scale(
                                            scale:0.6,

                                            child:CircularCheckBox(
                                                activeColor: Colors.red,

                                                value: false,
                                                onChanged: (bool value) {
                                                  print(value);

                                                  setState(() {
                                                    // _history = value;
                                                  });

                                                }

                                            ),



                                          ),
                                        ),

                                        Text("3 players",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w600 ,fontFamily:'Montserrat',fontSize: 10),)

                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children:<Widget> [
                                    Row(
                                      children: [
                                        Theme(
                                          data: ThemeData(unselectedWidgetColor:
                                          Colors.white,),
                                          child: Transform.scale(
                                            scale:0.6,

                                            child:CircularCheckBox(
                                                activeColor: Colors.red,

                                                value: false,
                                                onChanged: (bool value) {
                                                  print(value);

                                                  setState(() {
                                                    // _history = value;
                                                  });

                                                }

                                            ),



                                          ),
                                        ),
                                        Text("4 players",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w600 ,fontFamily:'Montserrat',fontSize: 10),)

                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height:10),
                            //tab bar
                            Container(
                              //decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
                              // height:126 ,
                              // width: 259,
                              child: new TabBar(
                                labelColor: Color(0xffFFFFFF),

                                indicatorWeight:20.0,
                                controller: _controller,
                                unselectedLabelColor: Color(0xff0A6E75
                                ),
                                indicator:BoxDecoration(
                                  // borderSide: BorderSide(width: 5.0),
                                  //insets: EdgeInsets.symmetric(horizontal:16.0),
                                  color:Color(0xff0A6E75),

                                ),
                                tabs: [
                                  Container(
                                    width: 165,
                                    height:36,

                                    decoration: BoxDecoration(
                                      //  borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xff0A6E75),

                                      ),
                                    ),
                                    child: Tab(
                                      child: Container(
                                          child:
                                          Text("Players Auto Select",style: TextStyle(fontSize: 8,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)


                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 155,
                                    height:36,

                                    decoration: BoxDecoration(
                                      //  borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xff0A6E75),

                                      ),
                                      //// color: Color(0xff1AA6B0),
                                    ),
                                    child: Tab(


                                      child: Container(

                                          child:

                                          Text("Players Manual Select",style: TextStyle(fontSize: 8,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)


                                      ),
                                    ),
                                  ),

                                ],
                              ),

                            ),
                            //tabbarview
                            new Container(
                              // padding: EdgeInsets.all(10.0),
                              height: 420.0,
                              child: new TabBarView(
                                controller: _controller,
                                children: <Widget>[
                                  Container(
                                    color:Color(0xff0A6E75),
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(

                                      child:
                                      Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight ,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10.0,left: 20),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: 55,
                                                        height: 55,
                                                        //  padding: EdgeInsets.only(top: 10.0,),
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image:DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage("assets/Ellipse 29.png"),
                                                            )

                                                        ),

                                                      ),

                                                    ],
                                                  ),
                                                  SizedBox(width:10),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("John Doe", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                      SizedBox(height:3),
                                                      Text("Beginner",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                                      SizedBox(height:3),
                                                      Text("Level 2",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                                    ],
                                                  ),
                                                  SizedBox(width:40),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Image.asset("assets/India Flag.png"),
                                                            SizedBox(width:10),
                                                            Text("India",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 40,),
                                          Align(
                                            alignment: Alignment.centerRight ,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10.0,left: 20),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(

                                                    children: [
                                                      Container(
                                                        width: 55,
                                                        height: 55,
                                                        //  padding: EdgeInsets.only(top: 10.0,),
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image:DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage("assets/Ellipse 27.png"),
                                                            )

                                                        ),

                                                      ),

                                                    ],
                                                  ),
                                                  SizedBox(width:10),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("John Doe", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                      SizedBox(height:3),
                                                      Text("Beginner",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                                      SizedBox(height:3),
                                                      Text("Level 2",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                                    ],
                                                  ),
                                                  SizedBox(width:40),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Image.asset("assets/India Flag.png"),
                                                            SizedBox(width:10),
                                                            Text("India",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 40,),
                                          Align(
                                            alignment: Alignment.centerRight ,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10.0,left: 20),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Column(

                                                    children: [
                                                      Container(
                                                        width: 55,
                                                        height: 55,
                                                        //  padding: EdgeInsets.only(top: 10.0,),
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image:DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: AssetImage("assets/Ellipse 32.png"),
                                                            )

                                                        ),

                                                      ),

                                                    ],
                                                  ),
                                                  SizedBox(width:10),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("John Doe", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                      SizedBox(height:3),
                                                      Text("Beginner",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                                      SizedBox(height:3),
                                                      Text("Level 2",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                                    ],
                                                  ),
                                                  SizedBox(width:40),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [

                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Image.asset("assets/India Flag.png"),
                                                            SizedBox(width:10),
                                                            Text("India",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],),
                                    ),
                                  ),

                                  Container(
                                    color:Color(0xff0A6E75),
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(

                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Container(
                                              height:32,
                                              width:400,
                                              margin:EdgeInsets.symmetric(horizontal: 10.0,vertical:4.0),
                                              decoration:BoxDecoration(
                                                color:Color(0xff4FAEB8),
                                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                              ),
                                              child:Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(

                                                      flex:1,
                                                      child:Container(
                                                        padding:EdgeInsets.all(8.0),
                                                        child: TextFormField(
                                                            decoration:InputDecoration(
                                                              border:InputBorder.none,
                                                              hintText:"Search Friend",
                                                              hintStyle:TextStyle( fontSize: 8.0,
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)

                                                              ),

                                                            )
                                                        ),
                                                      )
                                                  ),
                                                  Expanded(
                                                      flex:0,
                                                      child:Row(
                                                        children: [
                                                          IconButton(
                                                              onPressed:(){},
                                                              icon:Icon(Icons.search,size:20,color: Color(0xffFFFFFF))
                                                          )
                                                        ],
                                                      )
                                                  )
                                                ],
                                              )
                                          ),

                                          Container(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("If more than 3 players invited then First come First Play ",style: TextStyle(fontSize: 8,color:Color(0xffFFFFFF),
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5),
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
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              // width: 134,
                                                              //height: 15,
                                                                padding: EdgeInsets.all(5.0),
                                                                child:Row(
                                                                  mainAxisAlignment: MainAxisAlignment. spaceEvenly,
                                                                  children: [
                                                                    Container(
                                                                        height:27,
                                                                        width: 27,
                                                                        child: Image.asset("assets/Ellipse 34.png")),
                                                                    SizedBox(width: 10.0,),
                                                                    Text(data[index]["_FRIEND_NAME"],style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)

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
                                                                  child:RaisedButton(
                                                                      padding: EdgeInsets.zero,
                                                                      color: Color(0xff4DCBD4),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: new BorderRadius.circular(100.0)
                                                                      ),
                                                                      child: Text(" Invited",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                                      onPressed: (){

                                                                    game.sendInvites(widget.email, data[index]["_FRIEND_EMAIL"],widget.username);
                                                                      }
                                                                  ),
                                                                ),

                                                              ],
                                                            )

                                                          ],),


                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }
                                          ),


                                        ],
                                      ),
                                    ),
                                  )


                                ],),
                            ),
                          ],
                        ),

                      ),
                    ),


                  ),
                ),
              )
            ],
          ),
        ),


      ),
    ),

  );
}

    );
  }
}


