import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:katapult_screens/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'MainPage_11.dart';
import 'constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'socketprovider.dart';
// ignore: must_be_immutable

class Multiplayer extends StatefulWidget {
  List<String> selectedList = [];
  String single,name1,matchmode;
  String email;
  int correct,fifty,multiplier;
  @override
  _MultiplayerState createState() => _MultiplayerState(this.single,this.name1,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);
  Multiplayer(this.single,this.name1,this.selectedList,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);
}
// ignore: camel_case_types
class _MultiplayerState extends State<Multiplayer> {

  @override
  List data;
  List sata;
  String email,matchmode;
  String single;
  String name1;
  int correct,fifty,multiplier,number;
  _MultiplayerState(this.single,this.name1,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);

  List datas;

  Future<String> makRequest(List<String> Category) async{
    var token = await FlutterSession().get('token')  ;

    email= token.toString();
    var body = json.encode({'Category': Category});

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };
    String prl =Constant.base_url+"rewards/$email";
    // String prl ="http://18.222.73.151/user/Name/$dart";

    //var respons = await http.get(Uri.encodeFull(prl));
    var responses = await http.get(Uri.encodeFull(prl));
    setState(() {
      Map<String, dynamic> extracdata = jsonDecode(responses.body);
      datas = extracdata["recordset"];
      if(matchmode == 'Traditional \nGame'){
        number = 1;
        print(number);
      }else if(matchmode == 'Marathon \nGame'){
        number = 3;
        print(number);
      }
    });
    print(datas);
    final response = await http.post(Constant.base_url+"Multi",
      headers: headers,
      body: body,
    );
    try {
      if (response.statusCode == 200) {
        print(response.body);
      }
      else  {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }


    } catch (e) {
      print(e.message);
    }
    this.setState(() {
      Map<String, dynamic> extractdata = jsonDecode(response.body);
      print(extractdata);
      data = extractdata["data"];
    });
    print(data);
  }


  @override
  // ignore: must_call_super
  void initState(){
    makRequest(widget.selectedList);
  }
  String assetload = "assets/python.json";
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
      DefaultAssetBundle.of(context).loadString(assetload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (data == null) {
          return new Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                      fit: BoxFit.cover)),
              child: Container(
                color: Color(0xff13BBAA).withOpacity(0.80),
                child: new Center(
                  child: const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Screen48(mydata: data,email:email,single:single,datas:datas,correct:correct,fifty:fifty,multiplier:multiplier,matchmode:matchmode,number:number,selectedList:widget.selectedList);
        }
      },
    );
  }
}
class Screen48 extends StatefulWidget {
  List<String> selectedList = [];
  final  List mydata;
  final  String email,matchmode;
  final String single;
  final List datas;
  List sata;
  int correct,fifty,multiplier,number;
  Screen48({Key key, @required this.mydata,@required this.email,@required this.single,@required this.sata,@required this.datas,@required this.correct,@required this.fifty,@required this.multiplier,@required this.matchmode,@required this.number,@required this.selectedList}) : super(key: key);
  @override
  _Screen48State createState() => _Screen48State(mydata,email,single,datas,correct,fifty,multiplier,matchmode,number);
}
class _Screen48State extends State<Screen48> {
  final _bettingController = new TextEditingController();
  final  List mydata;
  final  String email,matchmode;
  final String single;
  final List datas;
  List sata;
  int correct,fifty,multiplier,number;
  _Screen48State(this.mydata,this.email,this.single,this.datas,this.correct,this.fifty,this.multiplier,this.matchmode,this.number);

  String get message => "           Congratulations,\nyou have reached 1st Milestone";
  //String dart = 'bhar1@gmail.com';
  int resume = 45;
  IO.Socket socket;
List leaders;
  String score;
  //bool isEnabled = true ;
  Future<String> makRequest() async{

    //String url =Constant.base_url+"rewards/$Email";
    String prl =Constant.base_url+"leader";

    //var response = await http.get(Uri.encodeFull(url));
    var respons = await http.get(Uri.encodeFull(prl));
    setState(() {
     /* Map<String, dynamic> extracdata = jsonDecode(response.body);
      rewards = extracdata["recordset"];*/
      Map<String, dynamic> extractdata = jsonDecode(respons.body);
      leaders = extractdata["recordset"];

    });

  }
  Future<void> userProg(String email, String Question, String selectedAnswer,
      String pointsGet, String Category) async {
    final response = await http.post(Constant.base_url + 'userProg', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userEmail': email,
      'Question': Question,
      'selectedAnswer': selectedAnswer,
      'pointsGet': pointsGet,
      'Category': Category
    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        return Timer(Duration(seconds: 2), nextquestion);
      } else if (response.statusCode == 402) {
        print(response.body);
        // displayDialog(context, "Email is already registered","Log in if you already have an account.");
      } else {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> userProgs(String email, String Question, String selectedAnswer,
      String pointsGet, String Category) async {
    final response = await http.post(Constant.base_url + 'userProg', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userEmail': email,
      'Question': Question,
      'selectedAnswer': selectedAnswer,
      'pointsGet': pointsGet,
      'Category': Category
    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        return Timer(Duration(seconds: 2), nextquestion,);
      } else if (response.statusCode == 402) {
        print(response.body);
        // displayDialog(context, "Email is already registered","Log in if you already have an account.");
      } else {
        print(response.body);
        //(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }
  void displayDialog(context, title, text) =>
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
                title: Text(title),
                content: Text(text)
            ),
      );
  Future<void> userReward(String email, String userChips) async {
    final response = await http.post(
        Constant.base_url + 'userResume', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': email,
      'userChips': userChips,

    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        /* return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>Screen11()));*/
      }
      else if (response.statusCode == 402) {
        print(response.body);
        displayDialog(context, "Insufficient Coins",
            "Sorry you doesn't have sufficient coins.");
      }
      else {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }


  Future<void> userAnswer(String email, String userChips ) async {
    final response = await http.post(Constant.base_url+'userAnswer', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': email,
      'userChips': userChips,

    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        return Timer(Duration(seconds: 2), nextquestion);
      }
      else if(response.statusCode == 402) {
        print(response.body);
        // displayDialog(context, "Email is already registered","Log in if you already have an account.");
      }
      else  {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }
  Color colortoshow = Colors.indigoAccent;
  Color right = Color(0xff16A816);
  Color wrong = Color(0xffEB2525);
  int marks = 0;
  int expgain=0;
  int chips=0;
  int coins =2;
  int questionanswered=0;
  int i = 1;
  String l;
  bool disableAnswer = false;
  var questionNumber=0;
  // extra varibale to iterate
  int j = 1;
  int f = 0;
  int timer = 15;
  String showtimer = "15";
  int index = 4;
  var random_array;
  //String variable for to store the data of every question
  String choose;
  int points;

  @override
  // ignore: must_call_super
  Map<String, Color> btncolor = {
    "a": Color(0xffEBEBEB),

    "b": Color(0xffEBEBEB),
    "c": Color(0xffEBEBEB),

    "d": Color(0xffEBEBEB),
  };

  bool canceltimer = false;

  genrandomarray(){
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0; ;) {
      distinctIds.add(rand.nextInt(10)+1);
      random_array = distinctIds.toSet().toList();
      if(random_array.length < 10){
        continue;
      }else{
        break;
      }
    }
    print(random_array);
    print(number);
  }

  @override
  void initState() {
    print("multiPlier value" + multiplier.toString());

    starttimer();
    genrandomarray();
    super.initState();

  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
  bool _value3x= false;

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();

        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }
  List data;

  void matches(int number,int round,int marks) async{
    setState(() {
      if(number == 0){
        return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>Screen1()));
      }else{
        return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>Rounds(widget.selectedList,single,email,correct,fifty,multiplier,matchmode,number,round,marks)));
      }

    });
  }

  int round =1;
  void nextquestion() {
    Provider.of<Testing>(context,listen:false).updatedData(widget.email, marks);
    canceltimer = false;
    timer = 15;
    showWidget();
    setState(() {
      if (j < mydata.length) {
        l = mydata[f]['Question'];
        f++;
        j++;
        isEnableA = true;
        isEnableB = true;
        isEnableC = true;
        isEnableD = true;
        coins=2;

      } else {

        print("before dec" + number.toString());

        number--;
        round++;
        print("after dec" + number.toString());
        matches(number,round,marks);
      }
      btncolor["a"] = Color(0xffEBEBEB);
      btncolor["b"] = Color(0xffEBEBEB);
      btncolor["c"] = Color(0xffEBEBEB);
      btncolor["d"] = Color(0xffEBEBEB);
      disableAnswer = false;
    });
    starttimer();
  }
  bool isEnableA = true;
  bool isEnableB = true;
  bool isEnableC = true;
  bool isEnableD = true;
  bool isEnablebtn = true;
  bool isEnablefty = true;
  bool isEnablempl = true;


  void correctAnswer(String k){
    correct--;
    print("correct value" + correct.toString());
    // userLifeline(dart,correct);
    if(correct == 0){
      isEnablebtn = false;
    }
    if(k == mydata[f]["ChoiceA"]){
      return checkanswer(mydata[f]["ChoiceA"], "a");
    }else if(k == mydata[f]["ChoiceB"]){
      return checkanswer(mydata[f]["ChoiceB"], "b");
    }
    else if(k == mydata[f]["ChoiceC"]){
      return checkanswer(mydata[f]["ChoiceC"], "c");
    }
    else if(k == mydata[f]["ChoiceD"]){
      return checkanswer(mydata[f]["ChoiceD"], "d");
    }
  }
  var _random = new Random();

  fiftyFifty(String c){
    fifty--;
    print("fifty value" + fifty.toString());
    if(fifty == 0){
      isEnablefty = false;
    }
    List answer = [mydata[f]["ChoiceA"],mydata[f]["ChoiceB"],mydata[f]["ChoiceC"],mydata[f]["ChoiceD"]];

    _random = Random();
    String correctAnswerId;
    for(int i = 0; i < answer.length; i++) {

      if (answer[i] == c) {
        correctAnswerId = answer[i];
      }

    }

    print("correctAnswerId: "+ correctAnswerId);

    var firstNumberToHide = 0 + _random.nextInt(3 - 0);
    var secondNumberToHide = 0 + _random.nextInt(3 - 0);

    while (answer[firstNumberToHide] == correctAnswerId || answer[secondNumberToHide] == correctAnswerId || answer[firstNumberToHide] == answer[secondNumberToHide]) {
      firstNumberToHide = 0 + _random.nextInt(3 - 0);
      secondNumberToHide = 0 + _random.nextInt(3 - 0);
    }

    print("first number:" + answer[firstNumberToHide]);
    print("second number:" + answer[secondNumberToHide]);


    if (firstNumberToHide == 0 || secondNumberToHide == 0) {
      setState(() {
        isEnableA = false;
      });
    }

    if (firstNumberToHide == 1 || secondNumberToHide == 1) {
      setState(() {
        isEnableB = false;
      });
    }

    if (firstNumberToHide == 2 || secondNumberToHide == 2) {
      setState(() {
        isEnableC = false;
      });
    }

    if (firstNumberToHide == 3 || secondNumberToHide == 3) {
      setState(() {
        isEnableD = false;
      });
    }
  }
  void multiPlier() {
    multiplier--;
    print("multiPlier value" + multiplier.toString());

    if(multiplier == 0){
      isEnablempl = false;
    }
    setState(() {
      coins=coins * 3;
      print(coins);
    });
  }
  void checkanswer(String k, String t) {

    if (mydata[f]['Correct'] == k) {
      marks = marks + 2;
      expgain = expgain + 3;
      chips = chips + 10;
      questionanswered = questionanswered + 1;
      colortoshow = right;
      choose = "Correct";
      points = coins;
      print(points);
      userProg(
          email, mydata[f]['Id'].toString(), choose, points.toString(), single);


    } else {
      colortoshow = wrong;
      choose = "Wrong";
      points = 0;

      userProgs(
          email, mydata[f]['Id'].toString(), choose, points.toString(), single);
    }
    setState(() {
      btncolor[t] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });
    // Timer(Duration(seconds: 2), nextquestion);
  }

  bool viewVisible = false ;

  void showWidget(){
    setState(() {
      viewVisible = true ;
    });
  }

  void hideWidget(){
    setState(() {
      viewVisible = false ;
    });
  }
  int _betting;
  void bettingcheck(int b){
    if(b > marks){
      displayDialog(context, "An Error Occurred", "Insufficient coins");
    }
    else {
      print("done");
    }
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);


    return WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  "Assessment",
                ),
                content: Text("You Can't Go Back At This Stage."),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Ok',
                    ),
                  )
                ],
              ));
        },
        child: Scaffold(
            backgroundColor: Color(0xffBB138A),
            body:SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bcImg.png"),
                        fit: BoxFit.cover)),
                child: Container(
                  color: Color(0xff13BBAA).withOpacity(0.80),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top:10.0,left:10,right:10.0),
                        child: Stack(
                          children: [
                            new LinearProgressIndicator(
                              //    value:  showtimer,

                              backgroundColor: Color(0xff992F9C)..withOpacity(0.44),

                            ),
                            Center(
                              child: Container(

                                height:50,
                                width:50,
                                child: Card(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(50.0)
                                    ),
                                    child: Center(child: Text("12",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),))),
                              ),
                            ),
                          ],

                        ),

                      ),
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
                            Flexible(
                                flex:3,
                                fit:FlexFit.tight,
                                child:Container(

                                )
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:leaders.length,
                        itemBuilder: (
                            BuildContext context,
                            int index) {
                          return new Container(
                            child: new Center(
                              child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 5.0,
                                        ),
                                        child: Center(
                                          child: Text(
                                            leaders[index]["userIds"],
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 5.0,
                                        ),
                                        child: Center(
                                          child: Text(
                                            leaders[index]["userIds"],
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    ),
                                  ]
                              ),

                            ),
                          );
                        },
                      ),

                      SizedBox(height: 5,),
                      Flexible(
                        flex: 9,
                        fit: FlexFit.tight,
                        child: Container(

                          child: Card(
                            color: Color(0xff99CFD6).withOpacity(0.40),
                            //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)
                            ),
                            child: Center(
                                child:Column(
                                    children:[
                                      SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Currrent Score: $marks",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
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
                                                        Image.asset('assets/eclipse.png',height: 17,width: 17,color: Color(0xff3644BA),),
                                                        Text("K",style: TextStyle(color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 12),),
                                                      ]
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Text(datas[0]['userChips'].toString(),style: TextStyle(fontSize: 12.0,
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                ],),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 40,),
                                      Container(
                                        child: Container(
                                          padding: EdgeInsets.all(15.0),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            mydata[f]['Question'],
                                            style: TextStyle(fontSize: 18.0,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700,color: Color(0xffFFFFFF)),),
                                        ),
                                      ),
                                      SizedBox(height: 50,),
                                      Container(
                                        child: AbsorbPointer(
                                          absorbing: disableAnswer,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children:<Widget>[
                                                      Container(
                                                        height: 65,
                                                        width: 152,
                                                        child:
                                                        RaisedButton(
                                                          onPressed: isEnableA ? () => checkanswer(mydata[f]['ChoiceA'],"a") : null,
                                                          child: Text(
                                                            mydata[f]['ChoiceA'],
                                                            style:TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                                              color: Color(0xff000000),fontSize: 12, ),
                                                          ),
                                                          color: btncolor["a"],
                                                          splashColor: Color(0xffEBEBEB),
                                                          highlightColor: Color(0xffEBEBEB),
                                                          shape:
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 65,
                                                        width: 152,
                                                        child:
                                                        RaisedButton(
                                                          onPressed: isEnableB ? () => checkanswer(mydata[f]['ChoiceB'],"b") : null,
                                                          child: Text(
                                                            mydata[f]['ChoiceB'],
                                                            style:TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                                              color: Color(0xff000000),fontSize: 12, ),
                                                          ),
                                                          color: btncolor["b"],
                                                          splashColor: Color(0xffEBEBEB),
                                                          highlightColor: Color(0xffEBEBEB),
                                                          shape:
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                        ),
                                                      ),

                                                    ]
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children:<Widget>[
                                                      Container(
                                                        height: 65,
                                                        width: 152,
                                                        child:
                                                        RaisedButton(
                                                          onPressed: isEnableC ? ()=> checkanswer(mydata[f]['ChoiceC'],"c") : null,
                                                          child: Text(
                                                            mydata[f]['ChoiceC'],
                                                            style:TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                                              color: Color(0xff000000),fontSize: 12, ),
                                                          ),
                                                          color: btncolor["c"],
                                                          splashColor: Color(0xffEBEBEB),
                                                          highlightColor: Color(0xffEBEBEB),
                                                          shape:
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 65,
                                                        width: 152,
                                                        child:
                                                        RaisedButton(
                                                          onPressed: isEnableD ? () => checkanswer(mydata[f]['ChoiceD'],"d") : null,
                                                          child: Text(
                                                            mydata[f]['ChoiceD'],
                                                            style:TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                                              color: Color(0xff000000),fontSize: 12, ),
                                                          ),
                                                          color: btncolor["d"],
                                                          splashColor: Color(0xffEBEBEB),
                                                          highlightColor: Color(0xffEBEBEB),
                                                          shape:
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                        ),
                                                      ),

                                                    ]
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      //betting
                                      Visibility(
                                        maintainSize: true,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        visible: viewVisible,
                                        child:Container(
                                          // padding: new EdgeInsets.all(5.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            color:Color(0xff16C5BE),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment. spaceAround,
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Text("Betting",style: TextStyle(fontSize: 14,fontFamily: "Montserrat",color: Color(0xffFFFFFF))),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                        height: 45,
                                                        width: 70,
                                                        child: Card(
                                                          color: Color(0xff1AA6B0),
                                                          shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(7.0),
                                                          ),
                                                          child: Center(
                                                            child: Container(
                                                              child: TextFormField(

                                                                controller: _bettingController,
                                                                keyboardType: TextInputType.number,
                                                                cursorColor: Colors.black,
                                                                onChanged: (val) {
                                                                  _betting = val as int;
                                                                },
                                                              ),

                                                            ),
                                                            // mainAxisAlignment: MainAxisAlignment.start,

                                                          ),
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      child: FlatButton(
                                                        child: Text('Submit', style: TextStyle(fontSize: 10.0,fontFamily: "Montserrat",)),
                                                        color: Color(0xff0A6E75),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(18.0),
                                                        ),
                                                        textColor: Color(0xffFFFFFF),
                                                        onPressed: () {

                                                          bettingcheck(int.parse(_bettingController.text));



                                                        },
                                                      ),
                                                    ),


                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 40,),
                                      //bottombars
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(

                                                  child: Card(
                                                    color: Color(0xff5555FF),
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(5.0)
                                                    ),
                                                    child:InkWell(
                                                      onTap:
                                                      isEnablebtn ? () =>  correctAnswer(mydata[f]["Correct"]):null,

                                                      child: Center(
                                                        child: Container(
                                                          height: 53,
                                                          width: 100,
                                                          padding: EdgeInsets.all(
                                                              5.0),
                                                          child: Image.asset('assets/Correct Answer.png',height: 46,width: 40,),
                                                        ),
                                                        // mainAxisAlignment: MainAxisAlignment.start,

                                                      ),
                                                    ),
                                                  )
                                              ),


                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                // height:50,
                                                //width:90,
                                                  child: Card(
                                                    color:Color(0xff009DFF),
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(5.0)
                                                    ),
                                                    child:InkWell(
                                                      onTap:

                                                      isEnablefty ? () =>   fiftyFifty(mydata[f]["Correct"]):null,

                                                      child: Center(
                                                        child: Container(
                                                          height: 53,
                                                          width: 100,
                                                          padding: EdgeInsets.only(
                                                            left: 20.0, top: 5.0, right: 20.0, ),
                                                          child: Image.asset('assets/50 50.png',height: 35,width: 77,),
                                                        ),
                                                        // mainAxisAlignment: MainAxisAlignment.start,

                                                      ),
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                // height:50,
                                                //width:90,
                                                  child: Card(
                                                    color:Color(0xff009DFF),
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(5.0)
                                                    ),
                                                    child:InkWell(
                                                      onTap:

                                                      isEnablempl ? () {

                                                        setState(() {
                                                          multiplier--;
                                                          print("multiPlier value" + multiplier.toString());

                                                          if(multiplier == 0){
                                                            isEnablempl = false;
                                                          }
                                                          coins = coins * 3;
                                                          print(coins);
                                                        });
                                                      }:null,
                                                      child: Center(
                                                        child: Container(
                                                          height: 53,
                                                          width: 100,
                                                          padding: EdgeInsets.only(
                                                            left: 20.0, top: 5.0, right: 20.0, ),
                                                          child: Image.asset('assets/3x.png',height: 35,width: 77,),
                                                        ),
                                                        // mainAxisAlignment: MainAxisAlignment.start,

                                                      ),
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),



                                        ],
                                      ),
                                    ]
                                )
                            ),

                          ),
                        ),
                      )
                    ],
                  ),

                ),
              ),
            )
        )
    );
  }


}


class Multiplayer2 extends StatefulWidget {
  List<String> selectedList = [];
  String single,matchmode;
  String dart;
  int correct,fifty,multiplier,number,round,score;
  @override
  _Multiplayer2State createState() => _Multiplayer2State(this.single,this.dart,this.correct,this.fifty,this.multiplier,this.matchmode,this.number,this.round,this.score);
  Multiplayer2(this.selectedList,this.single,this.dart,this.correct,this.fifty,this.multiplier,this.matchmode,this.number,this.round,this.score);
}
// ignore: camel_case_types
class _Multiplayer2State extends State<Multiplayer2> {

  @override
  List data;
  List sata;
  String dart,matchmode;
  String single;
  int correct,fifty,multiplier,number,round,score;
  _Multiplayer2State(this.single,this.dart,this.correct,this.fifty,this.multiplier,this.matchmode,this.number,this.round,this.score);

  List datas;

  Future<String> makRequest(List<String> Category) async{
    var token = await FlutterSession().get('token')  ;

    dart = token.toString();
    var body = json.encode({'Category': Category});

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };
    String prl =Constant.base_url+"rewards/$dart";
    // String prl ="http://18.222.73.151/user/Name/$dart";

    //var respons = await http.get(Uri.encodeFull(prl));
    var responses = await http.get(Uri.encodeFull(prl));
    setState(() {
      Map<String, dynamic> extracdata = jsonDecode(responses.body);
      datas = extracdata["recordset"];
    });
    print(datas);
    final response = await http.post(Constant.base_url+"Multi",
      headers: headers,
      body: body,
    );
    try {
      if (response.statusCode == 200) {
        print(response.body);
      }
      else  {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }


    } catch (e) {
      print(e.message);
    }
    this.setState(() {
      Map<String, dynamic> extractdata = jsonDecode(response.body);
      print(extractdata);
      data = extractdata["data"];
    });
    print(data);
  }


  @override
  // ignore: must_call_super
  void initState(){
    makRequest(widget.selectedList);
  }
  String assetload = "assets/python.json";
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
      DefaultAssetBundle.of(context).loadString(assetload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (data == null) {
          return new Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bcImg.png"),
                      fit: BoxFit.cover)),
              child: Container(
                color: Color(0xff13BBAA).withOpacity(0.80),
                child: new Center(
                  child: const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Matches(mydata: data,dart:dart,single:single,datas:datas,correct:correct,fifty:fifty,multiplier:multiplier,matchmode:matchmode,number:number,selectedList:widget.selectedList);
        }
      },
    );
  }
}
class Matches extends StatefulWidget {
  List<String> selectedList = [];
  final  List mydata;
  final  String dart,matchmode;
  final String single;
  final List datas;
  List sata;
  int correct,fifty,multiplier,number,round,score;
  Matches({Key key, @required this.mydata,@required this.dart,@required this.single,@required this.sata,@required this.datas,@required this.correct,@required this.fifty,@required this.multiplier,@required this.matchmode,@required this.number,@required this.selectedList,@required this.round,@required this.score}) : super(key: key);
  @override
  _MatchesState createState() => _MatchesState(mydata,dart,single,datas,correct,fifty,multiplier,matchmode,number,selectedList,round,score);
}
class _MatchesState extends State<Matches> {
  final _bettingController = new TextEditingController();
  List<String> selectedList = [];
  final  List mydata;
  final  String dart,matchmode;
  final String single;
  final List datas;
  List sata;
  int correct,fifty,multiplier,number,round,score;
  _MatchesState(this.mydata,this.dart,this.single,this.datas,this.correct,this.fifty,this.multiplier,this.matchmode,this.number,this.selectedList,this.round,this.score);

  String get message => "           Congratulations,\nyou have reached 1st Milestone";
  //String dart = 'bhar1@gmail.com';
  int resume = 45;
  //bool isEnabled = true ;
  Future<void> userProg(String email, String Question, String selectedAnswer,
      String pointsGet, String Category) async {
    final response = await http.post(Constant.base_url + 'userProg', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userEmail': email,
      'Question': Question,
      'selectedAnswer': selectedAnswer,
      'pointsGet': pointsGet,
      'Category': Category
    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        return Timer(Duration(seconds: 2), nextquestion);
      } else if (response.statusCode == 402) {
        print(response.body);
        // displayDialog(context, "Email is already registered","Log in if you already have an account.");
      } else {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> userProgs(String email, String Question, String selectedAnswer,
      String pointsGet, String Category) async {
    final response = await http.post(Constant.base_url + 'userProg', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userEmail': email,
      'Question': Question,
      'selectedAnswer': selectedAnswer,
      'pointsGet': pointsGet,
      'Category': Category
    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        return Timer(Duration(seconds: 2), nextquestion,);
      } else if (response.statusCode == 402) {
        print(response.body);
        // displayDialog(context, "Email is already registered","Log in if you already have an account.");
      } else {
        print(response.body);
        //(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }
  void displayDialog(context, title, text) =>
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
                title: Text(title),
                content: Text(text)
            ),
      );
  Future<void> userReward(String email, String userChips) async {
    final response = await http.post(
        Constant.base_url + 'userResume', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': email,
      'userChips': userChips,

    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        /* return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>Screen11()));*/
      }
      else if (response.statusCode == 402) {
        print(response.body);
        displayDialog(context, "Insufficient Coins",
            "Sorry you doesn't have sufficient coins.");
      }
      else {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }


  Future<void> userAnswer(String email, String userChips ) async {
    final response = await http.post(Constant.base_url+'userAnswer', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': email,
      'userChips': userChips,

    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        return Timer(Duration(seconds: 2), nextquestion);
      }
      else if(response.statusCode == 402) {
        print(response.body);
        // displayDialog(context, "Email is already registered","Log in if you already have an account.");
      }
      else  {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }
  Color colortoshow = Colors.indigoAccent;
  Color right = Color(0xff16A816);
  Color wrong = Color(0xffEB2525);
  int marks = 0;
  int expgain=0;
  int chips=0;
  int coins =2;
  int questionanswered=0;
  int i = 1;
  String l;
  bool disableAnswer = false;
  var questionNumber=0;
  // extra varibale to iterate
  int j = 1;
  int f = 0;
  int timer = 15;
  String showtimer = "15";
  var random_array;
  //String variable for to store the data of every question
  String choose;
  int points;

  @override
  // ignore: must_call_super
  Map<String, Color> btncolor = {
    "a": Color(0xffEBEBEB),

    "b": Color(0xffEBEBEB),
    "c": Color(0xffEBEBEB),

    "d": Color(0xffEBEBEB),
  };

  bool canceltimer = false;

  genrandomarray(){
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0; ;) {
      distinctIds.add(rand.nextInt(10)+1);
      random_array = distinctIds.toSet().toList();
      if(random_array.length < 10){
        continue;
      }else{
        break;
      }
    }
    print(random_array);
  }

  @override
  void initState() {
    print("multiPlier value" + multiplier.toString());

    starttimer();
    genrandomarray();
    super.initState();

  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
  bool _value3x= false;

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();

        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }
  void matches(int number) async{
    setState(() {
      if(number == 0){
        return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>Screen1()));
      }else{
        return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>Rounds(widget.selectedList,single,dart,correct,fifty,multiplier,matchmode,number,round,score)));
      }

    });
  }
  List data;
  void nextquestion() async {

    canceltimer = false;
    timer = 15;
    showWidget();
    setState(() {
      if (j < mydata.length) {
        l = mydata[f]['Question'];
        f++;
        j++;

        isEnableA = true;
        isEnableB = true;
        isEnableC = true;
        isEnableD = true;
        coins=2;

      } else {
        print("before dec" + number.toString());

        number--;
        round++;
        print("after dec" + number.toString());
        matches(number);
      }
      btncolor["a"] = Color(0xffEBEBEB);
      btncolor["b"] = Color(0xffEBEBEB);
      btncolor["c"] = Color(0xffEBEBEB);
      btncolor["d"] = Color(0xffEBEBEB);
      disableAnswer = false;
    });
    starttimer();
  }
  bool isEnableA = true;
  bool isEnableB = true;
  bool isEnableC = true;
  bool isEnableD = true;
  bool isEnablebtn = true;
  bool isEnablefty = true;
  bool isEnablempl = true;


  void correctAnswer(String k){
    correct--;
    print("correct value" + correct.toString());
    // userLifeline(dart,correct);
    if(correct == 0){
      isEnablebtn = false;
    }
    if(k == mydata[f]["ChoiceA"]){
      return checkanswer(mydata[f]["ChoiceA"], "a");
    }else if(k == mydata[f]["ChoiceB"]){
      return checkanswer(mydata[f]["ChoiceB"], "b");
    }
    else if(k == mydata[f]["ChoiceC"]){
      return checkanswer(mydata[f]["ChoiceC"], "c");
    }
    else if(k == mydata[f]["ChoiceD"]){
      return checkanswer(mydata[f]["ChoiceD"], "d");
    }
  }
  var _random = new Random();

  fiftyFifty(String c){
    fifty--;
    print("fifty value" + fifty.toString());
    if(fifty == 0){
      isEnablefty = false;
    }
    List answer = [mydata[f]["ChoiceA"],mydata[f]["ChoiceB"],mydata[f]["ChoiceC"],mydata[f]["ChoiceD"]];

    _random = Random();
    String correctAnswerId;
    for(int i = 0; i < answer.length; i++) {

      if (answer[i] == c) {
        correctAnswerId = answer[i];
      }

    }

    print("correctAnswerId: "+ correctAnswerId);

    var firstNumberToHide = 0 + _random.nextInt(3 - 0);
    var secondNumberToHide = 0 + _random.nextInt(3 - 0);

    while (answer[firstNumberToHide] == correctAnswerId || answer[secondNumberToHide] == correctAnswerId || answer[firstNumberToHide] == answer[secondNumberToHide]) {
      firstNumberToHide = 0 + _random.nextInt(3 - 0);
      secondNumberToHide = 0 + _random.nextInt(3 - 0);
    }

    print("first number:" + answer[firstNumberToHide]);
    print("second number:" + answer[secondNumberToHide]);


    if (firstNumberToHide == 0 || secondNumberToHide == 0) {
      setState(() {
        isEnableA = false;
      });
    }

    if (firstNumberToHide == 1 || secondNumberToHide == 1) {
      setState(() {
        isEnableB = false;
      });
    }

    if (firstNumberToHide == 2 || secondNumberToHide == 2) {
      setState(() {
        isEnableC = false;
      });
    }

    if (firstNumberToHide == 3 || secondNumberToHide == 3) {
      setState(() {
        isEnableD = false;
      });
    }
  }
  void multiPlier() {
    multiplier--;
    print("multiPlier value" + multiplier.toString());

    if(multiplier == 0){
      isEnablempl = false;
    }
    setState(() {
      coins=coins * 3;
      print(coins);
    });
  }
  void checkanswer(String k, String t) {
    if (mydata[f]['Correct'] == k) {
      score = score + 2;
      expgain = expgain + 3;
      chips = chips + 10;
      questionanswered = questionanswered + 1;
      colortoshow = right;
      choose = "Correct";
      points = coins;
      print(points);
      userProg(
          dart, mydata[f]['Id'].toString(), choose, points.toString(), single);


    } else {
      colortoshow = wrong;
      choose = "Wrong";
      points = 0;

      userProgs(
          dart, mydata[f]['Id'].toString(), choose, points.toString(), single);
    }
    setState(() {
      btncolor[t] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });
    // Timer(Duration(seconds: 2), nextquestion);
  }


  bool viewVisible = false ;

  void showWidget(){
    setState(() {
      viewVisible = true ;
    });
  }

  void hideWidget(){
    setState(() {
      viewVisible = false ;
    });
  }
  int _betting;
  void bettingcheck(int b){
    if(b > score){
      displayDialog(context, "An Error Occurred", "Insufficient Coins");
    }
    else {
      print("done");
    }
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  "Assessment",
                ),
                content: Text("You Can't Go Back At This Stage."),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Ok',
                    ),
                  )
                ],
              ));
        },
        child: Scaffold(
            backgroundColor: Color(0xffBB138A),
            body:SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bcImg.png"),
                        fit: BoxFit.cover)),
                child: Container(
                  color: Color(0xff13BBAA).withOpacity(0.80),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top:10.0,left:10,right:10.0),
                        child: Stack(
                          children: [
                            new LinearProgressIndicator(
                              //    value:  showtimer,

                              backgroundColor: Color(0xff992F9C)..withOpacity(0.44),

                            ),
                            Center(
                              child: Container(

                                height:50,
                                width:50,
                                child: Card(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(50.0)
                                    ),
                                    child: Center(child: Text("12",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),))),
                              ),
                            ),
                          ],

                        ),

                      ),
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
                            Flexible(
                                flex:3,
                                fit:FlexFit.tight,
                                child:Container(

                                )
                            )
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start ,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 5.0,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Emma : 0",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    ),


                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 5.0,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "John :0",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    ),


                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 5.0,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Miley 0",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                              ],

                            ),
                            SizedBox(width: 40,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start ,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 5.0,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Emma : 0",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    ),


                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 5.0,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Emma : 0",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    ),


                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 5.0,
                                          horizontal: 5.0,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Miley 0",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                              ],

                            ),
                          ]
                      ),
                      SizedBox(height: 5,),
                      Flexible(
                        flex: 9,
                        fit: FlexFit.tight,
                        child: Container(

                          child: Card(
                            color: Color(0xff99CFD6).withOpacity(0.40),
                            //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)
                            ),
                            child: Center(
                                child:Column(
                                    children:[
                                      SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Current Score: $score",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
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
                                                        Image.asset('assets/eclipse.png',height: 17,width: 17,color: Color(0xff3644BA),),
                                                        Text("K",style: TextStyle(color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 12),),
                                                      ]
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Text(datas[0]['userChips'].toString(),style: TextStyle(fontSize: 12.0,
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                ],),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 40,),
                                      Container(
                                        child: Container(
                                          padding: EdgeInsets.all(15.0),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            mydata[f]['Question'],
                                            style: TextStyle(fontSize: 18.0,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700,color: Color(0xffFFFFFF)),),
                                        ),
                                      ),
                                      SizedBox(height: 50,),
                                      Container(
                                        child: AbsorbPointer(
                                          absorbing: disableAnswer,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children:<Widget>[
                                                      Container(
                                                        height: 65,
                                                        width: 152,
                                                        child:
                                                        RaisedButton(
                                                          onPressed: isEnableA ? () => checkanswer(mydata[f]['ChoiceA'],"a") : null,
                                                          child: Text(
                                                            mydata[f]['ChoiceA'],
                                                            style:TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                                              color: Color(0xff000000),fontSize: 12, ),
                                                          ),
                                                          color: btncolor["a"],
                                                          splashColor: Color(0xffEBEBEB),
                                                          highlightColor: Color(0xffEBEBEB),
                                                          shape:
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 65,
                                                        width: 152,
                                                        child:
                                                        RaisedButton(
                                                          onPressed: isEnableB ? () => checkanswer(mydata[f]['ChoiceB'],"b") : null,
                                                          child: Text(
                                                            mydata[f]['ChoiceB'],
                                                            style:TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                                              color: Color(0xff000000),fontSize: 12, ),
                                                          ),
                                                          color: btncolor["b"],
                                                          splashColor: Color(0xffEBEBEB),
                                                          highlightColor: Color(0xffEBEBEB),
                                                          shape:
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                        ),
                                                      ),

                                                    ]
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children:<Widget>[
                                                      Container(
                                                        height: 65,
                                                        width: 152,
                                                        child:
                                                        RaisedButton(
                                                          onPressed: isEnableC ? ()=> checkanswer(mydata[f]['ChoiceC'],"c") : null,
                                                          child: Text(
                                                            mydata[f]['ChoiceC'],
                                                            style:TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                                              color: Color(0xff000000),fontSize: 12, ),
                                                          ),
                                                          color: btncolor["c"],
                                                          splashColor: Color(0xffEBEBEB),
                                                          highlightColor: Color(0xffEBEBEB),
                                                          shape:
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 65,
                                                        width: 152,
                                                        child:
                                                        RaisedButton(
                                                          onPressed: isEnableD ? () => checkanswer(mydata[f]['ChoiceD'],"d") : null,
                                                          child: Text(
                                                            mydata[f]['ChoiceD'],
                                                            style:TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                                              color: Color(0xff000000),fontSize: 12, ),
                                                          ),
                                                          color: btncolor["d"],
                                                          splashColor: Color(0xffEBEBEB),
                                                          highlightColor: Color(0xffEBEBEB),
                                                          shape:
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                        ),
                                                      ),

                                                    ]
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      //betting
                                      Visibility(
                                        maintainSize: true,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        visible: viewVisible,
                                        child:Container(
                                          // padding: new EdgeInsets.all(5.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            color:Color(0xff16C5BE),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment. spaceAround,
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Text("Betting",style: TextStyle(fontSize: 14,fontFamily: "Montserrat",color: Color(0xffFFFFFF))),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                        height: 45,
                                                        width: 70,
                                                        child: Card(
                                                          color: Color(0xff1AA6B0),
                                                          shape: new RoundedRectangleBorder(
                                                            borderRadius: new BorderRadius.circular(7.0),
                                                          ),
                                                          child: Center(
                                                            child: Container(
                                                              child: TextFormField(

                                                                controller: _bettingController,
                                                                keyboardType: TextInputType.number,
                                                                cursorColor: Colors.black,
                                                                onChanged: (val) {
                                                                  _betting = val as int;
                                                                },
                                                              ),

                                                            ),
                                                            // mainAxisAlignment: MainAxisAlignment.start,

                                                          ),
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      child: FlatButton(
                                                        child: Text('Submit', style: TextStyle(fontSize: 10.0,fontFamily: "Montserrat",)),
                                                        color: Color(0xff0A6E75),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(18.0),
                                                        ),
                                                        textColor: Color(0xffFFFFFF),
                                                        onPressed: () {

                                                          bettingcheck(int.parse(_bettingController.text));



                                                        },
                                                      ),
                                                    ),


                                                  ],
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 40,),
                                      //bottombars
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(

                                                  child: Card(
                                                    color: Color(0xff5555FF),
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(5.0)
                                                    ),
                                                    child:InkWell(
                                                      onTap:
                                                      isEnablebtn ? () =>  correctAnswer(mydata[f]["Correct"]):null,

                                                      child: Center(
                                                        child: Container(
                                                          height: 53,
                                                          width: 100,
                                                          padding: EdgeInsets.all(
                                                              5.0),
                                                          child: Image.asset('assets/Correct Answer.png',height: 46,width: 40,),
                                                        ),
                                                        // mainAxisAlignment: MainAxisAlignment.start,

                                                      ),
                                                    ),
                                                  )
                                              ),


                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                // height:50,
                                                //width:90,
                                                  child: Card(
                                                    color:Color(0xff009DFF),
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(5.0)
                                                    ),
                                                    child:InkWell(
                                                      onTap:

                                                      isEnablefty ? () =>   fiftyFifty(mydata[f]["Correct"]):null,

                                                      child: Center(
                                                        child: Container(
                                                          height: 53,
                                                          width: 100,
                                                          padding: EdgeInsets.only(
                                                            left: 20.0, top: 5.0, right: 20.0, ),
                                                          child: Image.asset('assets/50 50.png',height: 35,width: 77,),
                                                        ),
                                                        // mainAxisAlignment: MainAxisAlignment.start,

                                                      ),
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                // height:50,
                                                //width:90,
                                                  child: Card(
                                                    color:Color(0xff009DFF),
                                                    shape: new RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(5.0)
                                                    ),
                                                    child:InkWell(
                                                      onTap:

                                                      isEnablempl ? () {

                                                        setState(() {
                                                          multiplier--;
                                                          print("multiPlier value" + multiplier.toString());

                                                          if(multiplier == 0){
                                                            isEnablempl = false;
                                                          }
                                                          coins = coins * 3;
                                                          print(coins);
                                                        });
                                                      }:null,
                                                      child: Center(
                                                        child: Container(
                                                          height: 53,
                                                          width: 100,
                                                          padding: EdgeInsets.only(
                                                            left: 20.0, top: 5.0, right: 20.0, ),
                                                          child: Image.asset('assets/3x.png',height: 35,width: 77,),
                                                        ),
                                                        // mainAxisAlignment: MainAxisAlignment.start,

                                                      ),
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),



                                        ],
                                      ),
                                    ]
                                )
                            ),

                          ),
                        ),
                      )
                    ],
                  ),

                ),
              ),
            )
        )
    );
  }


}



class Rounds extends StatefulWidget {
  String matchmode,single;
  String dart;
  int correct,fifty,multiplier,number,round,score;
  List<String> selectedList = [];
  @override
  _RoundsState createState() => _RoundsState();

  Rounds(this.selectedList,this.single,this.dart,this.correct,this.fifty,this.multiplier,this.matchmode,this.number,this.round,this.score);
}
class _RoundsState extends State<Rounds> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Multiplayer2(widget.selectedList,widget.single,widget.dart,widget.correct,widget.fifty,widget.multiplier,widget.matchmode,widget.number,widget.round,widget.score)
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery
            .of(context)
            .size
            .height,

      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bcImg.png"),
              fit: BoxFit.cover)),
      child:Container(
        color: Color(0xff13BBAA).withOpacity(0.80),
        padding: EdgeInsets.all(10.0),
        child:Column(
            children: [
              SizedBox(height: 150,),
              Container(
                  child: Center(

                    child: Column(
                        children: [
                          Container(
                            /* height: 170,
                                      width: 321,*/
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: widget.selectedList.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Row(
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

                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 100,),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text("Round ${widget.round}", style: TextStyle(fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,color: Color(0xffFFFFFF),fontSize: 50,) ,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 4,),

                          SizedBox(height: 100,),
                          Align(
                            alignment: Alignment.center ,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text("Game starts in ....3", style: TextStyle(fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 14,) ,),
                                ],
                              ),
                            ),
                          ),
                        ]

                    ),
                  )
              ),
            ]
        ),

      ),
    );
  }
}
