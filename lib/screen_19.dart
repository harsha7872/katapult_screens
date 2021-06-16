import 'dart:convert';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/MainPage_11.dart';
import 'package:katapult_screens/screen_23.dart';
import 'package:katapult_screens/size_config.dart';
import 'package:popover/popover.dart';
import 'Screen14_Notifications.dart';
import 'User.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'screen_20.dart';


class Screen19 extends StatefulWidget {
  String username;
  String name1;
  final User user;
  int correct,fifty,multiplier;

  @override
  _Screen19State createState() => _Screen19State();
  Screen19(this.user,this.username,this.name1,this.correct,this.fifty,this.multiplier);
}

class _Screen19State extends State<Screen19> {
  String requestmode;
  List<String> requestcategory= [];
  Object get height1 => MediaQuery.of(context).size.height;
  Object get width1 => MediaQuery.of(context).size.width;
  int counter=0;
  bool selected = false;
  var userStatus = List<bool>();
  List<String> selectedList = [];

  Future<List<User>> _getUsers() async {
    var data = await http
        .get(Constant.base_url+"katapult/${widget.user.id}");

    var jsonData = json.decode(data.body);
    var fetch = jsonData["recordset"];

    List<User> users = [];

    for (var u in fetch) {
      User user =
      User(u["id"], u["parent_id"], u["category"], u["color"], u["isChecked"]);
      users.add(user);
      userStatus.add(false);
    }

    print(users.length);

    return users;
  }
  List data;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Color(0xffBB138A),
        body: SingleChildScrollView(
          child: Container(
            height: height1,
            width: width1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child: Container(

              color: Color(0xffBB138A).withOpacity(0.80),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                                                image: NetworkImage(Constant.base_url+"getPdfFile/anand"),
                                              )

                                          ),

                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Hi ${widget.username}", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                        SizedBox(height:5.0),
                                        Text("Its time to play!",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                      ],
                                    ),
                                    SizedBox(width:30.0),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                builder: (context) => Screen14(widget.username)
                                            ));
                                            setState(() {
                                              counter = 0;
                                            });
                                          },
                                          child: new Stack(
                                            children: <Widget>[
                                              new Image.network(Constant.base_url+"getPdfFile/Message",height: 21,),
                                              counter != 0 ? new Positioned(
                                                left: 21,
                                                bottom: 10,
                                                child: new Container(
                                                  padding: EdgeInsets.all(1),
                                                  decoration: new BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  constraints: BoxConstraints(
                                                    minWidth: 12,
                                                    minHeight: 12,
                                                  ),
                                                  child: Text(
                                                    '$counter',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ) : new Container()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),


                                    SizedBox(width:0.0),
                                    Column(
                                      children: [
                                        Image.network(Constant.base_url+"getPdfFile/Search")
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
                    SizedBox(height:5,),
                    //buttons
                    Flexible(
                      flex:1,
                      child: Container(
                        // padding: const EdgeInsets.only(left:13.0,right: 13,top: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment. spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height:53,
                                  width:122,
                                  child: RaisedButton(

                                    color: Color(0xffB71570),
                                    textColor: Colors.white,
                                    //padding: const EdgeInsets.all(10.0),
                                    child: Row(children: [
                                      Icon(Icons.arrow_back,color: Colors.white,size: 12,),
                                      SizedBox(width: 10,),
                                      Text("go back".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),
                                    ]),
                                    onPressed: (){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (context) => Screen1(),
                                      ));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)),
                                  ),
                                ),

                              ],),
                            Column(

                              children: [
                                Container(
                                  height:53,
                                  width:152,
                                  child: RaisedButton(
                                    color: Color(0xffB71570),
                                    textColor: Color(0xffFFFFFF),
                                    // padding: const EdgeInsets.only(left: 35,right: 34,top: 17,bottom: 17),
                                    child: Text("proceed".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),
                                    onPressed: (){
                                       Navigator.of(context).pushReplacement(MaterialPageRoute(
                                       builder: (context) =>screen4(Constant.single,widget.name1,selectedList,widget.correct,widget.fifty,widget.multiplier),
                                       ));

                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)),
                                  ),
                                ),


                              ],),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:5,),
                    //card
                    Flexible(
                      flex:10,
                      child: Container(
                        child: Card(
                            color: Color(0xffF17EDC).withOpacity(0.40),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)
                            ),
                            child: Container(
                              //  height: (638/SizeConfig.heightMultiplier)*SizeConfig.heightMultiplier,
                              //width:(341/SizeConfig.widthMultiplier)*SizeConfig.widthMultiplier,
                              height: 678,
                              width:341,
                              padding:const EdgeInsets.all(8.0),
                              child: Center(

                                child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                // padding: const EdgeInsets.only(top: 10,bottom: 0,),
                                                child: Text("Single Player", style: TextStyle(fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,color: Color(0xffFFFFFF),fontSize: 24,),),
                                              ),
                                              SizedBox(height: 3.0,),
                                              Container(
                                                //   padding: const EdgeInsets.only(top: 0,bottom: 10),
                                                child: Text("You can choose upto 3 different topics/sub-topics", style: TextStyle(fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w600,fontSize: 10.0,color: Color(0xffFFFFFF),),),),
                                              SizedBox(height: 5.0,),
                                              Container(
                                             //   padding: const EdgeInsets.only(left: 11,right: 9),
                                                child: Card(
                                                  color: Color(0xffF17EDC),
                                                  shape: new RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(10.0)
                                                  ),
                                                  child: Container(
                                                    height: 35,
                                                    width: 321,
                                                    child: ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: selectedList.length,
                                                      itemBuilder: (context, index) => Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Row(
                                                              children: [
                                                                Card(color: Color(0xffBE15A0),
                                                                  shape: new RoundedRectangleBorder(
                                                                      borderRadius: new BorderRadius.circular(10.0)
                                                                  ),
                                                                  child: Container(
                                                                    height: 10.0,
                                                                    width: 10.0,
                                                                    child: Icon(Icons.close,color: Color(0xffF17EDC),size: 10,),
                                                                  ),
                                                                ),
                                                                Text(selectedList[index],style: TextStyle(fontFamily: 'Montserrat',
                                                                  fontWeight: FontWeight.w600,color: Color(0xffBE15A0),fontSize: 8,),),
                                                                SizedBox(width: 10,),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Theme(
                                                        data: ThemeData(unselectedWidgetColor:
                                                        Colors.white,),
                                                        child: Transform.scale(
                                                          scale:0.6,

                                                          child:CircularCheckBox(
                                                            activeColor: Colors.red,
                                                            onChanged: (bool value){
                                                              setState(() {
                                                                if(value){
                                                                  selectedList.add(widget.user.category);
                                                                }else{
                                                                  selectedList.remove(widget.user.category);
                                                                }
                                                              });
                                                            },
                                                            value: selectedList.contains(widget.user.category),

                                                          ),



                                                        ),
                                                      ),


                                                      Card(
                                                        color: Color(widget.user.color),
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child:Container(
                                                          height: 20,
                                                          width: 20,
                                                          child: Image.network(Constant.base_url+'getPdfFile/${widget.user.category}'),
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.only(left: 9.72),
                                                          child: Text("${widget.user.category}",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 12.0,color: Color(0xffFFFFFF),),)),
                                                      Padding(
                                                          padding: EdgeInsets.only(left: 20),
                                                          child: Text("(Click again to choose History)",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8.0,color: Color(0xffFFFFFF),),
                                                          )
                                                      ),
                                                      harshaIcon(widget.user.category),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                                child: Divider(thickness: 1.0,),
                                              ),
                                              FutureBuilder(
                                                future: _getUsers(),
                                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                                  print(snapshot.data);
                                                  if (snapshot.data == null) {
                                                    return Container(child: Center(child: Text("Loading....")));
                                                  } else {
                                                    return Container(
                                                      height: 425,
                                                      child: ListView.builder(
                                                        scrollDirection: Axis.vertical,
                                                        shrinkWrap: true,
                                                        itemCount: snapshot.data.length,
                                                        itemBuilder: (BuildContext context, int index) {
                                                          return SingleChildScrollView(
                                                            child: new Container(
                                                              padding: EdgeInsets.only(right: 9.0),
                                                              child: new Center(
                                                                child: new  Row(
                                                                  mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Column(
                                                                      children: [
                                                                        Row(

                                                                          children: [
                                                                            Theme(
                                                                              data: ThemeData(unselectedWidgetColor:
                                                                              Colors.white,),
                                                                              child: Transform.scale(
                                                                                scale:0.6,

                                                                                child: CircularCheckBox(

                                                                                  focusColor: Colors.white,
                                                                                  activeColor: Colors.red,
                                                                                  onChanged: (bool value){
                                                                                    setState(() {
                                                                                      if(value){
                                                                                        selectedList.add(snapshot.data[index].category);
                                                                                      }else{
                                                                                        selectedList.remove(snapshot.data[index].category);
                                                                                      }
                                                                                    });
                                                                                  },
                                                                                  value: selectedList.contains(snapshot.data[index].category),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Card(
                                                                              color: Color(snapshot.data[index].color),
                                                                              shape: new RoundedRectangleBorder(
                                                                                  borderRadius: new BorderRadius.circular(5.0)
                                                                              ),
                                                                              child:Container(
                                                                                height: 20,
                                                                                width: 20,
                                                                                child: Image.network(Constant.base_url+'getPdfFile/${snapshot.data[index].category}'),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                                padding: EdgeInsets.only(left: 5),
                                                                                child: Text(snapshot.data[index].category,style: TextStyle(fontFamily: 'Montserrat',fontSize: 12.0,color: Colors.white,fontWeight: FontWeight.bold),)),

                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            harshaIcon1(snapshot.data[index].category),
                                                                            Card(
                                                                              // elevation: 2,
                                                                              shape: new RoundedRectangleBorder(
                                                                                borderRadius: new BorderRadius.circular(50.0),
                                                                                side: BorderSide( color: Color(0xffBE15A0)),
                                                                              ),
                                                                              child: InkWell(
                                                                                onTap:(){
                                                                                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                                  // builder: (context) =>
                                                                                  //   Screen20(snapshot.data[index],widget.user.category),
                                                                                  //));

                                                                                },
                                                                                child:Container(
                                                                                  height: 19,
                                                                                  width: 19,
                                                                                  child:Padding(
                                                                                    padding: const EdgeInsets.all(3.0),
                                                                                    child: Image.network(Constant.base_url+"getPdfFile/Leaderboard",
                                                                                      height: 15,width:5,),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Card(
                                                                              elevation: 2,
                                                                              shape: new RoundedRectangleBorder(
                                                                                borderRadius: new BorderRadius.circular(50.0),
                                                                                side: BorderSide( color: Color(0xffBE15A0)),
                                                                              ),
                                                                              child: InkWell(
                                                                                onTap:(){
                                                                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                                    builder: (context) =>
                                                                                        Screen20(snapshot.data[index],selectedList,widget.username,widget.name1,widget.correct,widget.fifty,widget.multiplier),
                                                                                  ));

                                                                                },
                                                                                child:Container(
                                                                                  height: 19,
                                                                                  width: 19,
                                                                                  child: Icon(FontAwesomeIcons.arrowRight,size: 9.37,
                                                                                      color: Color(0xffBE15A0,)
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )

                                                                          ],),

                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),


                                            ],
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            )
                        ),
                      ),
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

class harshaIcon extends StatelessWidget {
  const harshaIcon(this.name, {Key key}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(50.0),
        side: BorderSide( color: Color(0xffBE15A0)),
      ),
      child: Container(
          height: 19,
          width: 19,
          child: GestureDetector(
            child: Icon(FontAwesomeIcons.eye,size: 11.78,
              color: Color(0xffBE15A0),),
            onTap: (){
              showPopover(
                  context: context,
                  bodyBuilder: (context) {
                    return  Container(
                      color: Color(0xffBE15A0),
                      width: 301,
                      height: 204,
                      padding: EdgeInsets.only(left: 15,right: 20,top: 10),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.end,
                          children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  child: Card(color: Color(0xffFFFFFF),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0)
                                    ),
                                    child: Container(
                                      height: 10.0,
                                      width: 10.0,
                                      child: Icon(Icons.close,color: Color(0xffBE15A0),size: 6,),
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                ),

                              ],
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 15,
                                      child:  Text("Category: ${name}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                    )
                                  ],
                                ),
                                Column(children:[
                                  Card(
                                    color: Color(0xffBE15A0),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        side: BorderSide(color: Color(0xffE57AC5))
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 55,
                                      height: 18,
                                      child: Text(
                                        "Add as Favorite",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 5,fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ]),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Divider(thickness: 2,),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        width: 147,
                                        height: 32,
                                        child:  Text("This many people have added as Favorite",style: TextStyle(fontSize: 12,color: Color(0xffE57AC5)),)
                                    )

                                  ],
                                ),
                                SizedBox(width: 70,),
                                Column(children:[
                                  Container(
                                      width: 29,
                                      height: 15,
                                      child:  Text("0",style: TextStyle(fontSize: 12,color: Color(0xffE57AC5)),)
                                  )
                                ]),

                              ],
                            ),
                            SizedBox(height: 10,),
                            Divider(thickness: 2,),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        width: 180,
                                        height: 15,
                                        child:  Text("Your Level in ${name}",style: TextStyle(fontSize: 12,color: Color(0xffE57AC5)),)
                                    )

                                  ],
                                ),
                                SizedBox(width: 30,),
                                Column(children:[
                                  Container(
                                      width: 34,
                                      height: 15,
                                      child:  Text("Lev. 0",style: TextStyle(fontSize: 12,color: Color(0xffE57AC5)),)
                                  )
                                ]),

                              ],
                            ),

                          ]
                      ),

                    );
                  }
              );
            },
          )
      ),
    );
  }
}


class harshaIcon1 extends StatelessWidget {
  const harshaIcon1(this.name, {Key key}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(50.0),
        side: BorderSide( color: Color(0xffBE15A0)),
      ),
      child: Container(
          height: 19,
          width: 19,
          child: GestureDetector(
            child: Icon(FontAwesomeIcons.eye,size: 11.78,
              color: Color(0xffBE15A0),),
            onTap: (){
              showPopover(
                  context: context,
                  bodyBuilder: (context) {
                    return  Container(
                      color: Color(0xffBE15A0),
                      width: 301,
                      height: 204,
                      padding: EdgeInsets.only(left: 15,right: 20,top: 10),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.end,
                          children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  child: Card(color: Color(0xffFFFFFF),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0)
                                    ),
                                    child: Container(
                                      height: 10.0,
                                      width: 10.0,
                                      child: Icon(Icons.close,color: Color(0xffBE15A0),size: 6,),
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                ),

                              ],
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 15,
                                      child:  Text("Category: ${name}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                    )
                                  ],
                                ),
                                Column(children:[
                                  Card(
                                    color: Color(0xffBE15A0),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        side: BorderSide(color: Color(0xffE57AC5))
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 55,
                                      height: 18,
                                      child: Text(
                                        "Add as Favorite",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 5,fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ]),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Divider(thickness: 2,),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        width: 147,
                                        height: 32,
                                        child:  Text("This many people have added as Favorite",style: TextStyle(fontSize: 12,color: Color(0xffE57AC5)),)
                                    )

                                  ],
                                ),
                                SizedBox(width: 70,),
                                Column(children:[
                                  Container(
                                      width: 29,
                                      height: 15,
                                      child:  Text("0",style: TextStyle(fontSize: 12,color: Color(0xffE57AC5)),)
                                  )
                                ]),

                              ],
                            ),
                            SizedBox(height: 10,),
                            Divider(thickness: 2,),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        width: 180,
                                        height: 15,
                                        child:  Text("Your Level",style: TextStyle(fontSize: 12,color: Color(0xffE57AC5)),)
                                    )

                                  ],
                                ),
                                SizedBox(width: 30,),
                                Column(children:[
                                  Container(
                                      width: 34,
                                      height: 15,
                                      child:  Text("Lev. 0",style: TextStyle(fontSize: 12,color: Color(0xffE57AC5)),)
                                  )
                                ]),

                              ],
                            ),

                          ]
                      ),

                    );
                  }
              );
            },
          )
      ),
    );
  }
}






