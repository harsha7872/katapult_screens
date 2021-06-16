import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:katapult_screens/screen_46.dart';
import 'package:katapult_screens/socketprovider.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:katapult_screens/Screen14_Notifications.dart';
import 'package:katapult_screens/search.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Daily_challenges13.dart';
import 'Leaderboard(57).dart';
import 'Lifeline_17.dart';
import 'Marketplace.dart';
import 'MultiplayerMatch_34.dart';
import 'Profile(15).dart';
import 'Social(67).dart';
import 'constants.dart';
import 'loginscreen(6).dart';
void main() async {
  runApp(MyApp());}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Screen1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Screen1 extends StatefulWidget {
  Screen1({Key key}) : super(key: key);
  @override
  _Screen1State createState() => _Screen1State();
}
class _Screen1State extends State<Screen1> {
  String email;
  List rewards;
  List userDetails;
  int correct,fifty,multiplier;
  List rewards1;
  int QuestionsAnswered,FriendsWith,MatchesPlayed;
  // ignore: missing_return
  Future<String> makRequest() async{
    var token = await FlutterSession().get('token')  ;
    email= token.toString();
    String url =Constant.base_url+"rewards/$email";
    String prl =Constant.base_url+"Name/$email";
    //String image = Constant.base_url+"Image";
    var respons = await http.get(Uri.encodeFull(prl));
    var response = await http.get(Uri.encodeFull(url));
  //  var images = await http.get(Uri.encodeFull(image));
    setState(() {
      Map<String, dynamic> extractdata = jsonDecode(respons.body);
      userDetails = extractdata["recordset"];
      Map<String, dynamic> extracdata = jsonDecode(response.body);
      rewards = extracdata["recordset"];
    /*  Map<String, dynamic> imagedata = jsonDecode(images.body);
      rewards1 = imagedata["recordset"];*/
    });
    print(rewards);
    print(rewards1);
    print(userDetails);
  }
  // ignore: missing_return
  @override
  // ignore: must_call_super
  void initState(){
    makRequest();
    //imageRequest();
  }
  // bool submitting = false;
  @override
  Widget build(BuildContext ctx) {
    return FutureBuilder(
    builder: (context, snapshot) {
                if (userDetails == null) {
                  return new Scaffold(
                    body: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(Constant.base_url +
                                  "getPdfFile/bcImg"),
                              fit: BoxFit.cover)),
                      child: Container(
                        color: Color(0xff3555C9).withOpacity(0.80),
                        child: new Center(
                          child: const CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                else {
                  return Screen11(userDetails: userDetails,
                      rewards: rewards,
                      email: userDetails[0]["userEmail"],
                      correct: rewards[0]['CORRECT'],
                      fifty: rewards[0]['FIFTY50'],
                      multiplier: rewards[0]['MULTIPLIER'],
                       rewards1:rewards1,
                      QuestionsAnswered:rewards[0]['QuestionsAnswered'],
                      FriendsWith:rewards[0]['FriendsWith'],
                      MatchesPlayed:rewards[0]['MatchesPlayed']);
                }
              }
          );
        }
}
// ignore: must_be_immutable
class Screen11 extends StatefulWidget {
  List rewards,userDetails;
  String email;
  String name;
  List rewards1;
  int correct,fifty,multiplier;
  int QuestionsAnswered,FriendsWith,MatchesPlayed;
  Screen11({Key key,this.userDetails,this.rewards,this.email,this.name,this.correct,this.fifty,this.multiplier,this.rewards1,this.QuestionsAnswered,this.FriendsWith,this.MatchesPlayed}) : super(key: key);


  @override
  _Screen11State createState() => _Screen11State(this.userDetails,this.rewards,this.email,this.name,this.correct,this.fifty,this.multiplier,this.rewards1,this.QuestionsAnswered,this.FriendsWith,this.MatchesPlayed);
}
class _Screen11State extends State<Screen11> {
  String requestmode;
  List<String> requestcategory= [];
  List rewards,userDetails;
  String email;
  String name;List rewards1;
  int correct,fifty,multiplier;
  // ignore: non_constant_identifier_names
  int QuestionsAnswered,FriendsWith,MatchesPlayed;
  _Screen11State(this.userDetails,this.rewards,this.email,this.name,this.correct,this.fifty,this.multiplier,this.rewards1,this.QuestionsAnswered,this.FriendsWith,this.MatchesPlayed);
  int counter = 0;
  SharedPreferences logindata;
  String username;
  IO.Socket socket;
  String userSocket;
  List<String> selectedlist = [];
String to="harshi1@gmail.com";
String names = "Harshitha";
String gmail = "harshi1@gmail.com";
  String get matchmode => "Traditional Game";
  @override
// ignore: must_call_super
  void initState() {
Provider.of<Testing>(context,listen:false).connecttoSocket(userDetails[0]["userId"], userDetails[0]["userEmail"], userDetails[0]["firstName"], "0");
    // _send();
  }
  Future userFav(String email, String userCategories) async {
    final response =
    await http.post(Constant.base_url+'signin', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userEmail': email,
      'userCategories': userCategories,
    });
    try {
      if (response.statusCode == 201) {
        print(response.body);
        //  await FlutterSession().set('token',email);
        var route=new
        MaterialPageRoute(
            builder: (context) =>LoginScreen(
              //user:user,
            ));
        Navigator.of(context).push(route);
      }
      else  {
        print(response.body);
      }
    } catch (e) {
      print(e.message);
    }
  }
  // ignore: missing_return
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.blue  ,
            body:SingleChildScrollView(
              child: Container(
                  constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height,
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                          fit: BoxFit.cover)),
                  child: Container(
                    color: Color(0xff3555C9).withOpacity(0.80),
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      /// crossAxisAlignment: CrossAxisAlignment.center,
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
                                            GestureDetector(
                                              onTap:(){
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                    builder: (context) => Screen15(userDetails[0]["firstName"],userDetails[0]["userEmail"],widget.correct,widget.fifty,widget.multiplier,widget.QuestionsAnswered,widget.FriendsWith,widget.MatchesPlayed)
                                                ));
                                              },
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image:DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(Constant.base_url1 + "getPdfFile/anand.jpg"),
                                                    )

                                                ),

                                              ),
                                            )
                                          ],
                                        ),
                                        // SizedBox(width:10.0),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Hi ${userDetails[0]["firstName"]},", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                            SizedBox(height:5.0),
                                            Text("Its time to play!",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                          ],
                                        ),
                                        SizedBox(width:40.0),
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                    builder: (context) => Screen14(userDetails[0]["firstName"])
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
                          ),//Container
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height:53 ,
                            width: 400,
                            child: Card(
                              color: Color(0xff3644BA),
                              elevation: 10.0,
                              //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular (10.0)
                              ),
                              child: new Container(
                                //padding: EdgeInsets.all(30.0),
                                child: Align(
                                  alignment: Alignment.topRight ,
                                  child: Container(

                                    margin: EdgeInsets.only(top: 1.8.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Stack(
                                                    alignment: Alignment.center,
                                                    children: <Widget>[
                                                      Image.network(Constant.base_url+"getPdfFile/eclipse"),
                                                      Text("K",style: TextStyle(color: Color(0xff3644BA),fontSize: 12,fontWeight: FontWeight.w700,fontFamily: 'Montserrat')),
                                                    ]
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text( "   ${rewards[0]["userChips"]}", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                    Text("    Chips", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                  ],
                                                )],
                                            ),
                                          ],
                                        ),
                                        // SizedBox(width:10.0),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                new Icon(Icons.bolt, color: Color(0xffFFFFFF),),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("  0 ", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                    Text("  Experience", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                  ],
                                                )

                                              ],

                                            ),

                                            //Text("  Experience",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                          ],
                                        ),
                                        //SizedBox(width:10.0),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                new Icon(Icons.show_chart, color: Color(0xffFFFFFF),),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("  0 ", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                    Text("  Level", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                  ],
                                                )
                                              ],
                                            ),

                                            // Text("  Level",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                          ],
                                        ),
                                        //SizedBox(width:10.0),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                new Icon(Icons.mail, color: Color(0xffFFFFFF),),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("  0 ", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                    Text("  Total Wins", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                  ],
                                                ) ],
                                            ),

                                            // Text("  Total Wins",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ),
                        SizedBox(height:10.0),
                        Flexible(
                          flex: 9,
                          fit: FlexFit.tight,
                          child: Column(
                              children: [
                                Flexible(

                                  flex: 2,
                                  fit: FlexFit.tight,

                                  child: Container(
                                    height:124 ,
                                    width: 400,
                                    child: Card(
                                      color: Color(0xff5095E4).withOpacity(0.40),
                                      elevation: 10.0,
                                      //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular (10.0)
                                      ),
                                      child: InkWell(
                                        onTap:(){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (context) => Screen34(userDetails[0]["firstName"],userDetails[0]["userEmail"],widget.correct,widget.fifty,widget.multiplier),
                                          ));

                                        },
                                        child: new Container(
                                          padding: EdgeInsets.all(20.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children:[
                                                ClipRRect(
                                                  borderRadius: new BorderRadius.circular (30.0),
                                                ),
                                                Image.network(Constant.base_url+"getPdfFile/Multi Player",height: 74,width: 126),
                                                Text( "Multi Player",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 20.5,
                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),

                                              ],
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Flexible(
                                  flex: 2,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    height:124 ,
                                    width: 400,
                                    child: Card(
                                      color: Color(0xff5095E4).withOpacity(0.40),
                                      elevation: 10.0,
                                      //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular (10.0)
                                      ),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              builder: (context) => Screen17(userDetails[0]["firstName"],widget.email,widget.correct,widget.fifty,widget.multiplier,)
                                          ));
                                        },
                                        child: new Container(
                                          padding: EdgeInsets.all(20.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:[
                                                ClipRRect(
                                                  borderRadius: new BorderRadius.circular (30.0),
                                                ),
                                                Image.network(Constant.base_url+"getPdfFile/Single",height: 78,width: 95,),
                                                Text( "Single Player",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 20.5,fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),

                                              ],
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Flexible(
                                  flex: 4,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    height: 297,
                                    width: 400,
                                    child: Card(
                                      color: Color(0xff5095E4).withOpacity(0.40),
                                      elevation: 10.0,
                                      //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular (10.0)
                                      ),
                                      child: new Container(
                                        padding: EdgeInsets.all(15),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:[

                                              Container(
                                                padding: EdgeInsets.only(left:5.0,right: 5.0,bottom: 5.0,top: 0.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text( "Favourite Topics",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 20,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                    Container(
                                                      width: 55,
                                                      height: 18,
                                                      child:RaisedButton(
                                                          padding: EdgeInsets.zero,
                                                          color: Color(0xffE93838),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: new BorderRadius.circular(100.0)
                                                          ),
                                                          child: Text("View All",style: TextStyle(fontSize: 8.0,color: Color(0xffFFFFFF),
                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                          onPressed: (){
                                                            //_showAlertDialog(context);
                                                            Provider.of<Testing>(context,listen:false).sendInvites(gmail, to, names);
                                                            /*  setState(() {
                                                              counter++;
                                                            });*/
                                                            /*  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                  builder: (context) => Screen16(),
                                                                ));*/
                                                          }
                                                      ),
                                                    )

                                                  ],


                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                            // builder: (context) => Screen8(snapshot.data[index],),
                                                            //));
                                                          },
                                                          child: new Container(
                                                            height: 7.0.h,
                                                            width: 13.5.w,
                                                            child:Image.network(Constant.base_url+"getPdfFile/History"),
                                                          ),

                                                        ),

                                                      ),
                                                      Text("History",style: TextStyle(fontSize: 10,color: Colors.white,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600)),
                                                    ],
                                                  ),

                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                            // builder: (context) => Screen8(snapshot.data[index],),
                                                            //));
                                                          },
                                                          child: new Container(
                                                            height: 7.0.h,
                                                            width: 13.5.w,
                                                            child:Image.network(Constant.base_url+"getPdfFile/Geography"),
                                                          ),

                                                        ),

                                                      ),
                                                      Text("Geography",style: TextStyle(fontSize: 10,color: Colors.white,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                            // builder: (context) => Screen8(snapshot.data[index],),
                                                            //));
                                                          },
                                                          child: new Container(
                                                            height: 7.0.h,
                                                            width: 13.5.w,
                                                            child:Image.network(Constant.base_url+"getPdfFile/Science"),
                                                          ),

                                                        ),

                                                      ),
                                                      Text("Science",style: TextStyle(fontSize: 10,color: Colors.white,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600)),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                            // builder: (context) => Screen8(snapshot.data[index],),
                                                            //));
                                                          },
                                                          child: new Container(
                                                            height: 7.0.h,
                                                            width: 13.5.w,
                                                            child:Image.network(Constant.base_url+"getPdfFile/Movies"),
                                                          ),

                                                        ),

                                                      ),
                                                      Text("Movies",style: TextStyle(fontSize: 10,color: Colors.white,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600)),
                                                    ],
                                                  ),



                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                            // builder: (context) => Screen8(snapshot.data[index],),
                                                            //));
                                                          },
                                                          child: new Container(
                                                            height: 7.0.h,
                                                            width: 13.5.w,
                                                            child:Image.network(Constant.base_url+"getPdfFile/General Knowledge"),
                                                          ),

                                                        ),

                                                      ),
                                                      Text("General\nKnowledge",style: TextStyle(fontSize: 10,color: Colors.white,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600)),
                                                    ],
                                                  ),

                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                            // builder: (context) => Screen8(snapshot.data[index],),
                                                            //));
                                                          },
                                                          child: new Container(
                                                            height: 7.0.h,
                                                            width: 13.5.w,
                                                            child:Image.network(Constant.base_url+"getPdfFile/Cars"),
                                                          ),

                                                        ),

                                                      ),
                                                      Text("Cars",style: TextStyle(fontSize: 10,color: Colors.white,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600)),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                            // builder: (context) => Screen8(snapshot.data[index],),
                                                            //));
                                                          },
                                                          child: new Container(
                                                            height: 7.0.h,
                                                            width: 13.5.w,
                                                            child:Image.network(Constant.base_url+"getPdfFile/Video Games"),
                                                          ),

                                                        ),

                                                      ),
                                                      Text("Video\nGames",style: TextStyle(fontSize: 10,color: Colors.white,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Card(
                                                        shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                            // builder: (context) => Screen8(snapshot.data[index],),
                                                            //));
                                                          },
                                                          child: new Container(
                                                            height: 7.0.h,
                                                            width: 13.5.w,
                                                            child:Image.network(Constant.base_url+"getPdfFile/Google"),
                                                          ),

                                                        ),

                                                      ),
                                                      Text("Google",style: TextStyle(fontSize: 10,color: Colors.white,
                                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w600)),
                                                    ],
                                                  ),



                                                ],
                                              ),


                                            ],
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                       // SizedBox(height: 10.0,),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            width:900,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[

                                Flexible(
                                  flex:1,
                                  fit:FlexFit.loose,
                                  child: Container(
                                    height: 48,
                                    width: 100,
                                    child: Card(
                                      color: Color(0xffFFFFFF) ,
                                      //margin: EdgeInsets.only(right: 300,),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(5.0)
                                      ),
                                      //  margin: EdgeInsets.all(3.0),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              builder: (context) => Screen13(userDetails[0]["firstName"])
                                          ));
                                        },
                                        child: Center(
                                          child:  Image.network(
                                              Constant.base_url+"getPdfFile/Daily",
                                              fit: BoxFit.cover),
                                          // mainAxisAlignment: MainAxisAlignment.start,


                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  fit:FlexFit.loose,
                                  child: Container(
                                    height: 48,
                                    width: 100,
                                    child: Card(
                                      color: Color(0xff15B1F1) ,
                                      //margin: EdgeInsets.only(right: 300,),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(5.0)
                                      ),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              builder: (context) => Screen57(widget.name)
                                          ));
                                        },
                                        //margin: EdgeInsets.all(3.0),
                                        //margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                        child: Center(
                                          child: Container(

                                            // padding: EdgeInsets.all(18.0),
                                            child:Image.network(
                                                Constant.base_url+"getPdfFile/Group 74",fit: BoxFit.cover),
                                            // mainAxisAlignment: MainAxisAlignment.start,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex:1,
                                  fit:FlexFit.loose,
                                  child: Container(
                                    height: 48,
                                    width: 100,
                                    child: Card(
                                      color: Color(0xffFF6A56) ,
                                      //margin: EdgeInsets.only(right: 300,),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(5.0)
                                      ),

                                      // margin: EdgeInsets.all(3.0),
                                      //    margin: EdgeInsets.only(top: 5.0, bottom: 4.0),
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              builder: (context) => Screen67(widget.name)
                                          ));
                                        },
                                        child: Center(
                                          child: Image.network(
                                              Constant.base_url+"getPdfFile/Group 99",
                                              fit: BoxFit.cover),
                                          // mainAxisAlignment: MainAxisAlignment.start,

                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  fit:FlexFit.loose,
                                  child: Container(
                                      height: 48,
                                      width: 100,
                                      child: Card(
                                        color: Color(0xff490092) ,
                                        //margin: EdgeInsets.only(right: 300,),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(5.0)
                                        ),
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                builder: (context) => Screen62(widget.name)
                                            ));
                                          },
                                          //margin: EdgeInsets.all(5),
                                          // margin: EdgeInsets.only(top:5.0,bottom:4.0),
                                          child: Center(
                                            child:  Image.network(
                                                Constant.base_url+"getPdfFile/Group 100",
                                                fit: BoxFit.cover),
                                            // mainAxisAlignment: MainAxisAlignment.start,

                                          ),
                                        ),
                                      )
                                  ),
                                ),


                              ],
                            ),
                          ),//Container
                        ),
                      ],
                    ),
                  )
              ),
            )
        );
      }

  }




