import 'dart:convert';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/screen_10.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'categorypage(7).dart';
import 'constants.dart';


class Screen9 extends StatefulWidget {
  final User user;
  List<String> selectedList = [];

  @override
  _Screen9State createState() => _Screen9State();
  Screen9(this.user,this.selectedList);
}

class _Screen9State extends State<Screen9> {
  Object get height1 => MediaQuery.of(context).size.height;
  Object get width1 => MediaQuery.of(context).size.width;
  bool selected = false;
  var userStatus = List<bool>();
  //List<String> selectedList = [];

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
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff3555C9),
        body:SingleChildScrollView(
          child: Container(
            // height:height1,
            //  width:screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child: Container(
              height: height1,
              width: width1,
              color:Color(0xff3555C9).withOpacity(0.80),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Card(
                      color: Color(0xff5095E4).withOpacity(0.40),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      ),
                      child: Container(
                        height: 772,
                        width:341,
                        child: Center(

                          child: Column(
                            /// crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(

                                    // padding: EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(top: 15,bottom: 0,),
                                          child: Text("Select Favourite Topics", style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18, ),),
                                        ),
                                        SizedBox(height: 8.0,),
                                        Padding(
                                          padding:  EdgeInsets.only(top: 0,bottom: 1.5.h),
                                          child: Text("Select minimum 5 topics", style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 10.0,color: Colors.white,),),),
                                        Container(
                                          padding: EdgeInsets.only(left:2.0.h,right: 2.0.h,top: 0.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  RaisedButton(
                                                    color: Color(0xff3644BA),
                                                    textColor: Colors.white,
                                                    padding: EdgeInsets.only(left: 3.5.h,right: 3.5.h,top: 2.0.h,bottom: 2.0.h),
                                                    child: Row(children: [
                                                      Icon(Icons.arrow_back,color: Colors.white,size: 15,),
                                                      SizedBox(width: 10,),
                                                      Text("go back".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),
                                                    ]),
                                                    onPressed: (){
                                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                        builder: (context) => MyHomePage(),
                                                      ));
                                                    },
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10.0)),
                                                  ),

                                                ],),
                                              Column(
                                                children: [

                                                  RaisedButton(
                                                    color: Color(0xff3644BA),
                                                    textColor: Colors.white,
                                                    padding: EdgeInsets.only(left: 3.8.h,right: 3.8.h,top: 2.0.h,bottom: 2.0.h),
                                                    child: Text("PROCEED".toUpperCase(),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Colors.white,fontSize: 12,),),
                                                    onPressed: (){

                                                    },
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10.0)),
                                                  ),



                                                ],),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 11,right: 9),
                                          child: Card(
                                            color: Color(0xff3F6FD3),
                                            shape: new RoundedRectangleBorder(
                                                borderRadius: new BorderRadius.circular(10.0)
                                            ),
                                            child: Container(
                                              height: 6.0.h,
                                              width: 90.0.w,
                                              child:ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                itemCount: widget.selectedList.length,
                                                itemBuilder: (context, index) => Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Row(
                                                        children: [
                                                          Card(color: Color(0xffFFFFFF),
                                                            shape: new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(10.0)
                                                            ),
                                                            child: Container(
                                                              height: 10.0,
                                                              width: 10.0,
                                                              child: Icon(Icons.close,color: Color(0xff3644BA),size: 10,),
                                                            ),
                                                          ),
                                                          Text(widget.selectedList[index],style: TextStyle(fontFamily:
                                                          'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 8,),),
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
                                              Flexible(
                                                child: Container(
                                                    padding: EdgeInsets.only(left: 20),
                                                    child: Text("(Click again to choose History)",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 8.0,color: Color(0xffFFFFFF),),
                                                    )
                                                ),
                                              )



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
                                                height: 450,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.vertical,
                                                  shrinkWrap: true,
                                                  itemCount: snapshot.data.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return new Container(
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
                                                                Card(
                                                                  elevation: 2,
                                                                  shape: new RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(50.0),
                                                                    side: BorderSide( color: Color(0xff0D3B9B)),
                                                                  ),
                                                                  child: InkWell(
                                                                    onTap:(){
                                                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                        builder: (context) => Screen10(snapshot.data[index],widget.selectedList),
                                                                      ));

                                                                    },
                                                                    child:Container(
                                                                        height: 3.0.h,
                                                                        width: 3.0.h,
                                                                        child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
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
                    ),
                  ),
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
      builder: (context) => MyHomePage(),
    ));
  }
}



