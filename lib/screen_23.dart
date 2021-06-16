import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_admob/flutter_admob.dart';
import 'package:katapult_screens/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/popup.dart';
import 'package:katapult_screens/popup_content.dart';
import 'package:katapult_screens/result.dart';
import 'MainPage_11.dart';
import 'constants.dart';
// ignore: must_be_immutable
class screen4 extends StatefulWidget {
  List<String> selectedList = [];
  String single, name1;
  int correct;
  int fifty;
  int multiplier;
  @override
  _screen4State createState() =>
      _screen4State(this.single, this.name1, this.selectedList,this.correct,this.fifty,this.multiplier);
  screen4(this.single, this.name1, this.selectedList,this.correct,this.fifty,this.multiplier);
}
// ignore: camel_case_types
class _screen4State extends State<screen4> {
  @override
  List data;
  List sata;
  String dart;
  String single;
  int correct;
  int fifty;
  int multiplier;
  List<String> selectedList = [];
  String name1;
  _screen4State(this.single, this.name1, this.selectedList,this.correct,this.fifty,this.multiplier);
  List datas;
  Future<String> makRequest(List<String> Category) async {
    var token = await FlutterSession().get('token');
    dart = token.toString();
    var body = json.encode({'Category': Category});
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    String prl = Constant.base_url + "rewards/$dart";
    // String prl ="http://18.222.73.151/user/Name/$dart";
    //var respons = await http.get(Uri.encodeFull(prl));
    var responses = await http.get(Uri.encodeFull(prl));
    setState(() {
      Map<String, dynamic> extracdata = jsonDecode(responses.body);
      datas = extracdata["recordset"];
    });
    print(datas);
    final response = await http.post(
      Constant.base_url + "Typing",
      headers: headers,
      body: body,
    );
    try {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
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
  void initState() {
    makRequest(widget.selectedList);
  }
  String assetload = "assets/python.json";
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
      DefaultAssetBundle.of(context).loadString(assetload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        // print(mydata);
        if (data == null) {
          return new Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bcImg.png"),
                      fit: BoxFit.cover)),
              child: Container(
                color: Color(0xffBB138A).withOpacity(0.80),
                child: new Center(
                  child: const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          );
        } else {
          return quizpage(
              mydata: data,
              dart: name1,
              single: single,
              datas: datas,
              selectedList: selectedList,
              correct:correct,
              fifty:fifty,
              multiplier:multiplier);
        }
      },
    );
  }
}
class quizpage extends StatefulWidget {
  final List mydata;
  final String dart;
  final String single;
  final List datas;
  int correct;
  int fifty;
  int multiplier;
  List<String> selectedList = [];
  List sata;
  quizpage(
      {Key key,
        @required this.mydata,
        @required this.dart,
        @required this.single,
        @required this.sata,
        @required this.datas,
        @required this.selectedList,
        @required this.correct,
        @required this.fifty,
        @required this.multiplier
      })
      : super(key: key);
  @override
  _quizpageState createState() =>
      _quizpageState(mydata, dart, single, datas, selectedList,correct,fifty,multiplier);
}
class _quizpageState extends State<quizpage> {
  final List mydata;
  final String dart;
  final String single;
  final List datas;
  List<String> selectedList = [];
  List sata;
  int correct;
  int fifty,multiplier;
  _quizpageState(
      this.mydata, this.dart, this.single, this.datas, this.selectedList, this.correct,this.fifty,this.multiplier);
  String get message =>
      "           Congratulations,\nyou have reached 1st Milestone";
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
        showPopup1(context, _popupBody1(datas[0]["userChips"]), 'pop up');
        return Timer(Duration(seconds: 2), nextquestion);
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
  Future<void> showAdMob() async {
    await FlutterAdmob.init("ca-app-pub-1835997340427353~7906592133").then((_) {
      FlutterAdmob.showRewardVideo(
        "ca-app-pub-1835997340427353/1341183784",
      );
      // FlutterAdmob.showRewardVideo("ca-app-pub-3940256099942544/1712485313");
    });
  }
  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(title: Text(title), content: Text(text)),
  );
  Future<void> userReward(String email, String userChips) async {
    final response =
    await http.post(Constant.base_url + 'userResume', headers: {
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
      } else if (response.statusCode == 402) {
        print(response.body);
        displayDialog(context, "Insufficient Coins",
            "Sorry you doesn't have sufficient coins.");
      } else {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }
  Future<void> userAnswer(String email, String userChips) async {
    final response =
    await http.post(Constant.base_url + 'userAnswer', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': email,
      'userChips': userChips,
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

  Color colortoshow = Colors.indigoAccent;
  Color right = Color(0xff16A816);
  Color wrong = Color(0xffEB2525);
  int marks = 0;
  int expgain = 0;
  int chips = 0;
  int questionanswered = 0;
  int i = 1;
  String l;
  bool disableAnswer = false;
  var questionNumber = 0;
  // extra varibale to iterate
  int j = 1;
  int f = 0;
  int timer = 15;
  String showtimer = "15";
  var random_array;
  //String variable for to store the data of every question
  String choose;
  int points;
  //String email ="$dart";
  @override
  // ignore: must_call_super
  Map<String, Color> btncolor = {
    "a": Color(0xffEBEBEB),
    "b": Color(0xffEBEBEB),
    "c": Color(0xffEBEBEB),
    "d": Color(0xffEBEBEB),
  };
  bool canceltimer = false;
  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10) + 1);
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }
  @override
  void initState() {
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
  void nextquestion() {
    canceltimer = false;
    timer = 15;
    setState(() {
      if (j < mydata.length) {
        l = mydata[f]['Question'];
        f++;
        j++;
        isEnableA = true;
        isEnableB = true;
        isEnableC = true;
        isEnableD = true;
      } else {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Screen3(
                  marks: marks,
                  expgain: expgain,
                  chips: chips,
                  questionanswered: questionanswered,
                  selectedList: selectedList,
                  correct:correct,
                  fifty:fifty,
                  multiplier:multiplier,
                )));
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
  void correctAnswer(String k) {
    correct--;
    print("correct value" + correct.toString());
    // userLifeline(dart,correct);
    if(correct == 0){
      isEnablebtn = false;
    }
    if (k == mydata[f]["ChoiceA"]) {
      return checkanswer(mydata[f]["ChoiceA"], "a");
    } else if (k == mydata[f]["ChoiceB"]) {
      return checkanswer(mydata[f]["ChoiceB"], "b");
    } else if (k == mydata[f]["ChoiceC"]) {
      return checkanswer(mydata[f]["ChoiceC"], "c");
    } else if (k == mydata[f]["ChoiceD"]) {
      return checkanswer(mydata[f]["ChoiceD"], "d");
    }
  }
  var _random = new Random();
  fiftyFifty(String c) {
    fifty--;
    print("fifty value" + fifty.toString());
    if(fifty == 0){
      isEnablefty = false;
    }
    List answer = [
      mydata[f]["ChoiceA"],
      mydata[f]["ChoiceB"],
      mydata[f]["ChoiceC"],
      mydata[f]["ChoiceD"]
    ];
    _random = Random();
    String correctAnswerId;
    for (int i = 0; i < answer.length; i++) {
      if (answer[i] == c) {
        correctAnswerId = answer[i];
      }
    }
    print("correctAnswerId: " + correctAnswerId);
    var firstNumberToHide = 0 + _random.nextInt(3 - 0);
    var secondNumberToHide = 0 + _random.nextInt(3 - 0);
    while (answer[firstNumberToHide] == correctAnswerId ||
        answer[secondNumberToHide] == correctAnswerId ||
        answer[firstNumberToHide] == answer[secondNumberToHide]) {
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
  void checkanswer(String k, String t) {
    if (mydata[f]['Correct'] == k) {
      marks = marks + 2;
      expgain = expgain + 3;
      chips = chips + 10;
      questionanswered = questionanswered + 1;
      colortoshow = right;
      choose = "Correct";
      points = 2;
      userProg(
          dart, mydata[f]['Id'].toString(), choose, points.toString(), single);
      if (marks == 4) {
        showPopup(context, _popupBody(), 'Popup Demo');
      }
      // pointsincrement();
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
            body: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bcImg.png"),
                        fit: BoxFit.cover)),
                child: Container(
                  color: Color(0xffBB138A).withOpacity(0.80),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Center(
                            child: Text(
                              showtimer,
                              style: TextStyle(
                                fontSize: 35.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Times New Roman',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Row(
                          children: [
                            Flexible(
                              child: Card(
                                color: Color(0xff3644BA),
                                //margin: EdgeInsets.all(30.0),
                                // margin: EdgeInsets.only(right: 250, top: 10.0),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(10.0)),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                            Screen1()));
                                              },
                                              child: Icon(
                                                Icons.arrow_back,size:12,
                                                color: Colors.white,
                                              )),
                                        ),
                                        Flexible(
                                          child: GestureDetector(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.home,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                                flex: 3, fit: FlexFit.tight, child: Container())
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        flex: 9,
                        fit: FlexFit.tight,
                        child: Container(
                          child: Card(
                            color: Color(0xffF17EDC).withOpacity(0.40),
                            //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            child: Center(
                                child: Column(children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Currrent Score: $marks",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffFFFFFF),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 150,
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Stack(
                                                  alignment: Alignment.center,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      'assets/eclipse.png',
                                                      height: 17,
                                                      width: 17,
                                                      color: Color(0xff3644BA),
                                                    ),
                                                    Text(
                                                      "K",
                                                      style: TextStyle(
                                                          color: Color(0xffFFFFFF),
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 12),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                datas[0]['userChips'].toString(),
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xffFFFFFF)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    child: Container(
                                      padding: EdgeInsets.all(15.0),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        mydata[f]['Question'],
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Container(
                                    child: AbsorbPointer(
                                      absorbing: disableAnswer,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                  Container(
                                                    height: 65,
                                                    width: 152,
                                                    child: RaisedButton(
                                                      onPressed: isEnableA
                                                          ? () => checkanswer(
                                                          mydata[f]['ChoiceA'],
                                                          "a")
                                                          : null,
                                                      child: Text(
                                                        mydata[f]['ChoiceA'],
                                                        style: TextStyle(
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: Color(0xff000000),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      color: btncolor["a"],
                                                      splashColor:
                                                      Color(0xffEBEBEB),
                                                      highlightColor:
                                                      Color(0xffEBEBEB),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 65,
                                                    width: 152,
                                                    child: RaisedButton(
                                                      onPressed: isEnableB
                                                          ? () => checkanswer(
                                                          mydata[f]['ChoiceB'],
                                                          "b")
                                                          : null,
                                                      child: Text(
                                                        mydata[f]['ChoiceB'],
                                                        style: TextStyle(
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: Color(0xff000000),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      color: btncolor["b"],
                                                      splashColor:
                                                      Color(0xffEBEBEB),
                                                      highlightColor:
                                                      Color(0xffEBEBEB),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                    ),
                                                  ),
                                                ]),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                  Container(
                                                    height: 65,
                                                    width: 152,
                                                    child: RaisedButton(
                                                      onPressed: isEnableC
                                                          ? () => checkanswer(
                                                          mydata[f]['ChoiceC'],
                                                          "c")
                                                          : null,
                                                      child: Text(
                                                        mydata[f]['ChoiceC'],
                                                        style: TextStyle(
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: Color(0xff000000),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      color: btncolor["c"],
                                                      splashColor:
                                                      Color(0xffEBEBEB),
                                                      highlightColor:
                                                      Color(0xffEBEBEB),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 65,
                                                    width: 152,
                                                    child: RaisedButton(
                                                      onPressed: isEnableD
                                                          ? () => checkanswer(
                                                          mydata[f]['ChoiceD'],
                                                          "d")
                                                          : null,
                                                      child: Text(
                                                        mydata[f]['ChoiceD'],
                                                        style: TextStyle(
                                                          fontFamily: 'Montserrat',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: Color(0xff000000),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      color: btncolor["d"],
                                                      splashColor:
                                                      Color(0xffEBEBEB),
                                                      highlightColor:
                                                      Color(0xffEBEBEB),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                                    ),
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 150,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // height:50,
                                            //width:90,
                                              child: Card(
                                                color: Color(0xff5555FF),
                                                shape: new RoundedRectangleBorder(
                                                    borderRadius:
                                                    new BorderRadius.circular(5.0)),
                                                child: InkWell(
                                                  onTap:
                                                  //Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                  //builder: (context) => Screen13()
                                                  //));

                                                  isEnablebtn ? () =>  correctAnswer(mydata[f]["Correct"]):null,

                                                  child: Center(
                                                    child: Container(
                                                      height: 53,
                                                      width: 155,
                                                      padding: EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 5.0,
                                                        right: 20.0,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/Correct Answer.png',
                                                        height: 50,
                                                        width: 100,
                                                      ),
                                                    ),
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            // height:50,
                                            //width:90,
                                              child: Card(
                                                color: Color(0xff009DFF),
                                                shape: new RoundedRectangleBorder(
                                                    borderRadius:
                                                    new BorderRadius.circular(5.0)),
                                                child: InkWell(
                                                  onTap:
                                                  isEnablefty ? () =>   fiftyFifty(mydata[f]["Correct"]):null,

                                                  child: Center(
                                                    child: Container(
                                                      height: 53,
                                                      width: 155,
                                                      padding: EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 5.0,
                                                        right: 20.0,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/50 50.png',
                                                        height: 35,
                                                        width: 77,
                                                      ),
                                                    ),
                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ])),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  showPopup(BuildContext context, Widget widget, String title,
      {BuildContext popupContext}) {

    Navigator.push(
      context,
      PopupLayout(
        top: 10,
        left: 20,
        right: 20,
        bottom: 30,
        child: PopupContent(
          content: Scaffold(
            backgroundColor: Color(0xffBB138A),
            body: widget,
          ),
        ),
      ),
    );
  }

  Widget _popupBody() {
    int reward = 100;
    return SingleChildScrollView(
      child: Container(
        //  height:812,
        // width: 375,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bcImg.png"), fit: BoxFit.cover)),
        child: Container(
          color: Color(0xffBB138A).withOpacity(0.80),
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Row(
                    children: [
                      Flexible(
                        child: Card(
                          color: Color(0xff3644BA),
                          //margin: EdgeInsets.all(30.0),
                          // margin: EdgeInsets.only(right: 250, top: 10.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Screen1()));
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Flexible(
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.home,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),

                              // mainAxisAlignment: MainAxisAlignment.start,
                            ),
                          ),
                        ),
                      ),
                      Flexible(flex: 3, fit: FlexFit.tight, child: Container())
                    ],
                  ),
                ),

                Flexible(
                  flex:8,
                  fit: FlexFit.tight,
                  child: Container(
                    /* height:695 ,
                    width: 341,*/
                    child: Card(
                      color: Color(0xffF17EDC).withOpacity(0.40),
                      // margin: EdgeInsets.only(top: 10.0,right: 25.0,left: 25.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(children: [
                            //score heading
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("Current Score:0",
                                        style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Montserrat',
                                            fontSize: 10))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              Image.asset(
                                                'assets/eclipse.png',
                                                color: Color(0xff3644BA),
                                              ),
                                              Text("K",
                                                  style: TextStyle(
                                                      color: Color(0xffFFFFFF),
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontFamily:
                                                      'Montserrat')),
                                            ]),
                                        Text("1000",
                                            style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat',
                                                fontSize: 10))
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            //image and gk name
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 170,
                                  width: 305,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: widget.selectedList.length,
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        Container(
                                          // padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                // margin: EdgeInsets.only(top: 10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      widget
                                                          .selectedList[index],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'Montserrat',
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        color:
                                                        Color(0xffFFFFFF),
                                                        fontSize: 24,
                                                      ),
                                                    ),
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
                              ],
                            ),
                            //success image
                            Column(
                              children: [
                                Container(
                                  /*  width: 186,
                                      height: 187,*/
                                  // padding: EdgeInsets.only(top: 40.0,bottom: 130.0),
                                  child: Image.asset("assets/Milestone.png"),
                                ),
                              ],
                            ),
                            //message
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    message,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffFFFFFF),
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "You Win",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffFFFFFF),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: 35,
                                          width: 35,
                                          child: Image.asset(
                                            'assets/eclipse.png',
                                            color: Color(0xff3644BA),
                                          )),
                                      Text("K",
                                          style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Montserrat')),
                                    ]),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "$reward",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff3644BA),
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //question number
                            SizedBox(
                              height: 10,
                            ),
                            //button
                            ButtonTheme(
                              buttonColor: Color(0xffB71570),
                              minWidth: 217.0,
                              height: 49.0,
                              child: RaisedButton(
                                onPressed: () {
                                  //rewardmilestone();
                                  Navigator.pop(context);
                                },
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: Text("Continue Game",
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                            //Quit
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) => Screen3(
                                                  marks: marks,
                                                  expgain: expgain,
                                                  chips: chips,
                                                  questionanswered:
                                                  questionanswered,
                                                  selectedList: selectedList,
                                                  correct: correct,
                                                  fifty:fifty,
                                                  multiplier:multiplier,
                                                ),
                                              ));
                                        },
                                        child: Text("Quit",
                                            style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Montserrat'))),
                                  ],
                                ),
                              ),
                            ),

                          ]),
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

  showPopup1(BuildContext context, Widget widget, String datas,
      {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 30,
        left: 30,
        right: 30,
        bottom: 50,
        child: PopupContent(
          content: Scaffold(
            backgroundColor: Color(0xffBB138A),
            resizeToAvoidBottomInset: false,
            body: widget,
          ),
        ),
      ),
    );
  }

  checkAvailability(int k, BuildContext ctx) {
    if (resume <= k) {
      return userRewards(dart, resume.toString(), ctx);
    } else {
      displayDialog(context, "Insufficient Coins",
          "Sorry you doesn't have sufficient coins.");
    }
  }

  Future<void> userRewards(
      String email, String userChips, BuildContext ctx) async {
    final response =
    await http.post(Constant.base_url + 'userResume', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': email,
      'userChips': userChips,
    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        Navigator.pop(ctx);
      } else if (response.statusCode == 402) {
        print(response.body);
        displayDialog(context, "Insufficient Coins",
            "Sorry you doesn't have sufficient coins.");
      } else {
        print(response.body);
        //displayDialog(context, "Error", "An unknown error occurred.");
      }
    } catch (e) {
      print(e.message);
    }
  }

  Widget _popupBody1(int datars) {
    return SingleChildScrollView(
      child: Container(
        /* height: 812,
        width: 375,*/
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bcImg.png"), fit: BoxFit.cover)),
        child: Container(
          color: Color(0xffBB138A).withOpacity(0.80),
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  /*height: 604,
                  width: 341,*/
                  child: Card(
                    color: Color(0xffF17EDC).withOpacity(0.40),
                    // margin: EdgeInsets.only(top: 10.0,bottom: 150.0,right: 25.0,left: 25.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Center(
                      child: Column(children: [
                        // SizedBox(height: 100,),

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
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.selectedList[index],
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xffFFFFFF),
                                                fontSize: 24,
                                              ),
                                            ),
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
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            // margin: EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                Text(
                                  "Total Score: 2",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFFFFF),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: [
                                  Container(
                                    //height:41,width: 118,
                                    child: new RaisedButton(
                                      onPressed: () {
                                        showAdMob();
                                      },
                                      color: Color(0xffE57AC5),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(10.0),
                                          side: BorderSide(
                                              color: Color(0xffBE14A0))),
                                      child: new Text(
                                        "Watch Video \nto Continue",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFFFFFF),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(15.0),
                                    child: new Text(
                                      "OR",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFFFFFF),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    // height: 41,
                                    width: 118,
                                    child: new RaisedButton(
                                        onPressed: () {
                                          checkAvailability(datars, context);
                                        },
                                        color: Color(0xffE57AC5),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                            new BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color(0xffBE14A0))),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            new Text(
                                              "Use",
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                                fontSize: 12,
                                              ),
                                            ),
                                            Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    'assets/eclipse.png',
                                                    color: Color(0xff3644BA),
                                                  ),
                                                  Text("K",
                                                      style: TextStyle(
                                                          color:
                                                          Color(0xffFFFFFF),
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontFamily:
                                                          'Montserrat')),
                                                ]),
                                            new Text(
                                              resume.toString(),
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffFFFFFF),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              'assets/eclipse.png',
                                              color: Color(0xff3644BA),
                                            ),
                                            Text("K",
                                                style: TextStyle(
                                                    color: Color(0xffFFFFFF),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Montserrat')),
                                          ]),
                                      new Text(
                                        "$datars chips",
                                        //  datas.toString() + ' Available',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFFFFFF),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ]),
                        SizedBox(
                          height: 150,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Quit",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffFFFFFF),
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
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
