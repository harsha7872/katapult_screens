import 'dart:convert';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:katapult_screens/screen_41.dart';
import 'package:popover/popover.dart';
import 'MainPage_11.dart';
import 'Screen14_Notifications.dart';
import 'User.dart';
import 'constants.dart';



class Screen40 extends StatefulWidget {
  final User user;
  String username;
  String email;
  String matchmode;
  int correct,fifty,multiplier;
  List<String> selectedList = [];

  @override
  _Screen40State createState() => _Screen40State();
  Screen40(this.user,this.selectedList,this.username,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);
}

class _Screen40State extends State<Screen40> {
  String requestmode;
  List<String> requestcategory= [];
  Object get height1 => MediaQuery.of(context).size.height;
  Object get width1 => MediaQuery.of(context).size.width;
  int counter=0;
  String email;
  String matchmode;
  bool selected = false;
  var userStatus = List<bool>();
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

  bool _history = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff13BBAA),
      body:
      SingleChildScrollView(
        child: Container(
          height: height1,
          width: width1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child:Container(

              color: Color(0xff13BBAA).withOpacity(0.80),
            padding: const EdgeInsets.all(8.0),
              child: Column(
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

                                    color: Color(0xff0A6E75),
                                    textColor: Colors.white,
                                    //padding: const EdgeInsets.all(10.0),
                                    child: Row(children: [
                                      Icon(Icons.arrow_back,color: Colors.white,size: 15,),
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
                                    color: Color(0xff0A6E75),
                                    textColor: Color(0xffFFFFFF),
                                    // padding: const EdgeInsets.only(left: 35,right: 34,top: 17,bottom: 17),
                                    child: Text("proceed".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),
                                    onPressed: (){
                                      /*  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) =>screen4(Constant.single,widget.name1,selectedList),
                                        ));*/

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
                    Flexible(
                        flex:10,
                        child:Container(

                      child: Card(
                        color: Color(0xff99CFD6).withOpacity(0.40),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Center(

                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          // padding: const EdgeInsets.only(top: 10,bottom: 0,),
                                          child: Text("MultiPlayer Player", style: TextStyle(fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w700,color: Colors.white,fontSize: 24, ),),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Container(
                                          // padding: const EdgeInsets.only(top: 0,bottom: 10,),
                                          child: Text("You can choose upto 3 different topics/sub-topics", style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 10.0,color: Colors.white,),),),
                                        SizedBox(height: 5.0,),
                                        Container(
                                          //    padding: const EdgeInsets.all(10.0),
                                          child: Card(
                                            color: Color(0xff99CFD6),
                                            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(10.0)
                                            ),
                                            child: Container(
                                              height: 51,
                                              width: 400,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                itemCount: widget.selectedList.length,
                                                itemBuilder: (context, index) => Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          Card(color: Color(0xff1AA6B0),
                                                            shape: new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(10.0)
                                                            ),
                                                            child: Container(
                                                              height: 10.0,
                                                              width: 10.0,
                                                              child: Icon(Icons.close,color: Color(0xff0A6E75),size: 10,),
                                                            ),
                                                          ),
                                                          Text(widget.selectedList[index],style: TextStyle(fontFamily:
                                                          'Montserrat',fontWeight: FontWeight.w600,color: Color(0xff0A6E75),fontSize: 8,),),
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
                                                            widget.selectedList.add(widget.user.category);
                                                          }else{
                                                            widget. selectedList.remove(widget.user.category);
                                                          }
                                                        });
                                                      },
                                                      value: widget.selectedList.contains(widget.user.category),

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
                                                    child: Text("(Click again to choose History)",style: TextStyle(fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w600,fontSize: 6.8,color: Color(0xffFFFFFF),),
                                                    )
                                                ),
                                                harshaIcon(widget.user.category),
                                              ],
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left:7.0,right: 7.0),
                                          child: Divider(thickness: 1.0,),
                                        ),
                                        FutureBuilder(
                                          future: _getUsers(),
                                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                                            print(snapshot.data);
                                            if (snapshot.data == null) {
                                              return Container(child: Center(child: Text("Loading...")));
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
                                                                                  widget.selectedList.add(snapshot.data[index].category);
                                                                                }else{
                                                                                  widget.selectedList.remove(snapshot.data[index].category);
                                                                                }
                                                                              });
                                                                            },
                                                                            value: widget.selectedList.contains(snapshot.data[index].category),
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
                                                                          child: Text(snapshot.data[index].category,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 12.0,color: Color(0xffFFFFFF),),)),

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
                                                                        elevation: 2,
                                                                        shape: new RoundedRectangleBorder(
                                                                          borderRadius: new BorderRadius.circular(50.0),
                                                                          side: BorderSide( color: Color(0xff0A6E75)),
                                                                        ),
                                                                        child: InkWell(
                                                                          onTap:(){
                                                                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                            //builder: (context) =>
                                                                            //Screen10(snapshot.data[index],widget.user.category,widget.title),
                                                                            //));

                                                                          },
                                                                          child:Container(
                                                                            height: 19,
                                                                            width: 19,
                                                                            child:Padding(
                                                                              padding: const EdgeInsets.all(3.0),
                                                                              child: Image.network(Constant.base_url+"getPdfFile/Leaderboard",
                                                                                height: 12,width: 10,),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Card(
                                                                        elevation: 2,
                                                                        shape: new RoundedRectangleBorder(
                                                                          borderRadius: new BorderRadius.circular(50.0),
                                                                          side: BorderSide( color: Color(0xff0A6E75)),
                                                                        ),
                                                                        child: InkWell(
                                                                          onTap:(){
                                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                              builder: (context) =>
                                                                                  Screen41(snapshot.data[index],widget.selectedList,widget.username,widget.email,widget.correct,widget.fifty,widget.multiplier,matchmode),
                                                                            ));

                                                                          },
                                                                          child:Container(
                                                                            height: 19,
                                                                            width: 19,
                                                                            child: Icon(FontAwesomeIcons.arrowRight,size: 9.37,
                                                                                color: Color(0xff0A6E75,)
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
                      ),
                    )
          ),
                  ],
                ),

          ),
        ),
      ),
    );
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
        side: BorderSide( color: Color(0xff0A6E75)),
      ),
      child: Container(
          height: 19,
          width: 19,
          child: GestureDetector(
            child: Icon(FontAwesomeIcons.eye,size: 11.78,
              color: Color(0xff3EA89B),),
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
                                  child: Card(color: Color(0xff3EA89B),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0)
                                    ),
                                    child: Container(
                                      height: 10.0,
                                      width: 10.0,
                                      child: Icon(Icons.close,color: Color(0xff0A6E75),size: 6,),
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
                                    color: Color(0xff0A6E75),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        side: BorderSide(color: Color(0xff40A99A))
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
                                        child:  Text("This many people have added as Favorite",style: TextStyle(fontSize: 12,color: Color(0xff1AA6B0)),)
                                    )

                                  ],
                                ),
                                SizedBox(width: 70,),
                                Column(children:[
                                  Container(
                                      width: 29,
                                      height: 15,
                                      child:  Text("0",style: TextStyle(fontSize: 12,color: Color(0xff1AA6B0)),)
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
                                        child:  Text("Your Level in ${name}",style: TextStyle(fontSize: 12,color: Color(0xff1AA6B0)),)
                                    )

                                  ],
                                ),
                                SizedBox(width: 30,),
                                Column(children:[
                                  Container(
                                      width: 34,
                                      height: 15,
                                      child:  Text("Lev. 0",style: TextStyle(fontSize: 12,color: Color(0xff1AA6B0)),)
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
        side: BorderSide( color: Color(0xff0A6E75)),
      ),
      child: Container(
          height: 19,
          width: 19,
          child: GestureDetector(
            child: Icon(FontAwesomeIcons.eye,size: 11.78,
              color: Color(0xff3EA89B),),
            onTap: (){
              showPopover(
                  context: context,
                  bodyBuilder: (context) {
                    return  Container(
                      color: Color(0xff3EA89B),
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
                                      child: Icon(Icons.close,color: Color(0xff0A6E75),size: 6,),
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
                                    color: Color(0xff0A6E75),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(10.0),
                                        side: BorderSide(color: Color(0xff40A99A))
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
                                        child:  Text("This many people have added as Favorite",style: TextStyle(fontSize: 12,color: Color(0xff1AA6B0)),)
                                    )

                                  ],
                                ),
                                SizedBox(width: 70,),
                                Column(children:[
                                  Container(
                                      width: 29,
                                      height: 15,
                                      child:  Text("0",style: TextStyle(fontSize: 12,color: Color(0xff1AA6B0)),)
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
                                        child:  Text("Your Level",style: TextStyle(fontSize: 12,color: Color(0xff1AA6B0)),)
                                    )

                                  ],
                                ),
                                SizedBox(width: 30,),
                                Column(children:[
                                  Container(
                                      width: 34,
                                      height: 15,
                                      child:  Text("Lev. 0",style: TextStyle(fontSize: 12,color: Color(0xff1AA6B0)),)
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


