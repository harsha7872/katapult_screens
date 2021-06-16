import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:katapult_screens/MainPage_11.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'facebook.dart';
import 'googlemain.dart';
import 'signupscreen(5).dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = new TextEditingController();
  final _emailController = new TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Object get height1 => MediaQuery.of(context).size.height;
  String _password, _email;
  bool _autoValidate = false;
  bool _isLoading = false;
  bool visible = true;
  bool newuser;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );
  Future signinUser(String email, String password) async {
    final response =
    await http.post(Constant.base_url+'signin', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userEmail': email,
      'userPassword': password,
    });
    try {
      if (response.statusCode == 200) {
        print(response.body);

        await FlutterSession().set('token',email);
        var route=new
        MaterialPageRoute(
            builder: (context) =>Screen1(
              //user:user,
            ));
        Navigator.of(context).pushReplacement(route);
      }
      else  {
        print(response.body);
        displayDialog(context, "An Error Occurred", "Invalid Email and Password");
      }


    } catch (e) {
      print(e.message);
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool _isChecked = false;
    return Scaffold(
      // backgroundColor: Color(0xff3555C9).withOpacity(0.80),
        body:SingleChildScrollView(
          child: Container(
            // height: height1,
            width: screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child: Container(
              height: height1,
              color:Color(0xff3555C9).withOpacity(0.80),
              // padding:EdgeInsets.only(bottom: 25),
              padding: const EdgeInsets.all(14.0),
              child: Form (
                key: _formkey,
                autovalidate: _autoValidate,
                child: Container(
                  padding: const EdgeInsets.only(top:64.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: new Container(
                          // height: 546,
                          width:330,
                          child: Card(
                            // margin: EdgeInsets.only(top: 100.0,right: 25.0,left: 25.0),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)
                            ),
                            child: Center(
                              child: Container(

                                padding: EdgeInsets.all(27.0),
                                // mainAxisAlignment: MainAxisAlignment.start,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 10,),
                                    Text("Welcome back to Katapult", style: TextStyle(color: Color(0xff4C0096),fontSize: 24.0,fontWeight: FontWeight.bold,fontFamily: 'Montserrat')
                                    ),
                                    SizedBox(height: 15,),
                                    new TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      autofocus: false,
                                      controller: _emailController,
                                      validator: validateEmail,
                                      onChanged: (value) => _email = value,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color: Color(0xffCCCCCC),
                                            fontSize: 12,
                                            fontFamily: 'Montserrat'
                                        ),
                                      ),

                                    ),
                                    SizedBox(height: 10,),

                                    new TextFormField(
                                      autofocus: false,
                                      controller: _passwordController,
                                      obscureText: visible,
                                      validator: validatePassword,
                                      onChanged: (value) => _password = value,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            color: Color(0xffCCCCCC),
                                            fontSize: 12,
                                            fontFamily: 'Montserrat'
                                        ),
                                      ),

                                    ),
                                    SizedBox(height: 30,),
                                    //login btn
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        signinUser(_email, _password)
                                            .then((void nothing) {
                                          print("done");
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        }).catchError((e) => print(e));
                                      },
                                      child: _isLoading
                                          ? Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                        ),
                                      )
                                          : new Container(
                                        //height: 49,
                                        //width: 217,
                                        padding: EdgeInsets.symmetric(vertical: 18,horizontal: 60),
                                        decoration: BoxDecoration(
                                            color: Color(0xffB71570),
                                            borderRadius: BorderRadius. circular(10)
                                        ),
                                        alignment:Alignment.center,

                                        child:Text("LOGIN",style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12,fontFamily: 'Montserrat'),),
                                      ),
                                    ),
                                    //remember functionality
                                    Container(

                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ListTileTheme(
                                            // scale:0.5,
                                            contentPadding: EdgeInsets.all(0),
                                            child: Checkbox(
                                                activeColor: Color(0xff000000),
                                                value: true,
                                                onChanged: (bool value) {
                                                  print(value);

                                                  setState(() {
                                                    _isChecked = value;
                                                  });

                                                }
                                            ),
                                          ),
                                          Text("Remember me",style: TextStyle(fontSize: 10,color: Color(0xff000000),fontFamily: 'Montserrat'),)

                                        ],
                                      ),
                                    ),

                                    //SizedBox(height: 5),
                                    Text("Or",style: TextStyle(fontSize: 12,color: Color(0xff333333),fontFamily: 'Montserrat'),),

                                    SizedBox(height: 5,),
                                    //login facebook
                                    Container(

                                      child: Card(
                                        color: Color(0xffFFFFFF) ,
                                        //margin: EdgeInsets.all(30.0),
                                        // margin: EdgeInsets.only(right: 250,top: 10.0),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(10.0),
                                            side: BorderSide(color: Color(0xff707070))

                                        ),

                                        child: Container(

                                          child: Center(
                                            child: Container(
                                              height:31,
                                              width:217,
                                              /* height: 4.0.h,
                                              width: 50.0.w,*/
                                              padding: EdgeInsets.all(2.0),
                                              child: Column(
                                                children:<Widget> [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Card(
                                                        color: Color(0xffFFFFFF),
                                                        shape: new RoundedRectangleBorder(
                                                          //borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                builder: (context) => FacebookPage()
                                                            ));
                                                          },
                                                          child: new Container(
                                                            height:17,
                                                            width:17,
                                                            child:Image.network(Constant.base_url+"getPdfFile/Facebook"),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text("Login With Facebook",style: new TextStyle(
                                                          color: Color(0xff333333),
                                                          fontFamily: "Montserrat",
                                                          fontSize: 10
                                                      ),)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              // mainAxisAlignment: MainAxisAlignment.start,

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 10,),
                                    //Login with google
                                    Container(

                                      child: Card(
                                        color: Color(0xffFFFFFF) ,
                                        //margin: EdgeInsets.all(30.0),
                                        // margin: EdgeInsets.only(right: 250,top: 10.0),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(10.0),
                                            side: BorderSide(color: Color(0xff707070))

                                        ),

                                        child: Container(

                                          child: Center(
                                            child: Container(
                                              height:31,
                                              width:217,
                                              /* height: 4.0.h,
                                              width: 50.0.w,*/
                                              padding: EdgeInsets.all(2.0),
                                              child: Column(
                                                children:<Widget> [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Card(
                                                        color: Color(0xffFFFFFF),
                                                        shape: new RoundedRectangleBorder(
                                                          //borderRadius: new BorderRadius.circular(5.0)
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                builder: (context) => GoogleApp()
                                                            ));
                                                          },
                                                          child: new Container(
                                                            height:17,
                                                            width:17,
                                                            child:Image.network(Constant.base_url+"getPdfFile/gmail"),

                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text("Login With Google    ",style: new TextStyle(
                                                          color: Color(0xff333333),
                                                          fontFamily: "Montserrat",
                                                          fontSize: 10
                                                      ),)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              // mainAxisAlignment: MainAxisAlignment.start,

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      /* width: 55.0.w,
                                            height: 4.0.h,*/
                                      /* width:265,
                                        height:45,*/
                                      // padding: EdgeInsets.only(left: 2.0.h,right: 2.0.h),
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("   We recommend using Facebook or Google,", style: TextStyle(color: Colors.black,
                                                  fontSize: 10,fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat')
                                              ),
                                            ]
                                        )
                                    ),
                                    SizedBox(height:7),
                                    Container(
                                      /* width: 55.0.w,
                                            height: 4.0.h,*/
                                      /* width:265,
                                        height:45,*/
                                      // padding: EdgeInsets.only(left: 2.0.h,right: 2.0.h),
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("so you can play against your friends on Katapult", style: TextStyle(color: Colors.black,
                                                  fontSize: 10,fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat')
                                              ),
                                            ]
                                        )
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 5,),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          //  margin: EdgeInsets.all(bottom: 15.0,),
                          // padding: EdgeInsets.only (left:4.0.h,right:4.0.h,top: 0.0,bottom: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[

                                  new Text(
                                    "New to Katapult?",
                                    style: new TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat'),
                                  ),
                                  // SizedBox(height:5,),
                                  new GestureDetector(
                                    onTap: ()
                                    {
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder: (context) => SignupScreen()
                                      ));
                                    },
                                    child: new Text(
                                      "SIGNUP",

                                      style: new TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat'),
                                    ),
                                  )
                                ],
                              ),
                            ],

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
  String validatePassword(String value) {
    Pattern pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required *";
    }
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required *";
    } else if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
