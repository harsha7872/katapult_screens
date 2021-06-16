import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'facebook.dart';
import 'googlemain.dart';
import 'loginscreen(6).dart';
import 'categorypage(7).dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  Object get height1 => MediaQuery.of(context).size.height;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _mobileController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController =  new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _email,_password,_confirmpassword,_name,_mobile;
  bool _validate = false;
  bool _isLoading = false;
  Future<void> signupUser(String email, String password,String mobile, String name ) async {
    final response = await http.post('http://18.222.73.151/user/signup', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userEmail': email,
      'userPassword': password,
      'userMobile': mobile,
      'firstName': name,

    });

    try {
      if (response.statusCode == 201) {
        print(response.body);

        await FlutterSession().set('token',email);
        var route=new
        MaterialPageRoute(
            builder: (context) =>MyHomePage(
              //user:user,
            ));
        Navigator.of(context).pushReplacement(route);
      }
      else if(response.statusCode == 402) {
        print(response.body);
        displayDialog(context, "Email is already registered",
            "Log in if you already have an account.");
      }
      else  {
        print(response.body);
        displayDialog(context, "Error", "An unknown error occurred.");
      }


    } catch (e) {
      print(e.message);
    }
  }

  void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
            title: Text(title),
            content: Text(text)
        ),
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Color(0xffFF6B57),
        key: scaffoldKey,
        body:SingleChildScrollView(
          child: Container(
            height: height1,
            width: screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child: Container(
              color: Color(0xffFF6B57).withOpacity(0.80),
              padding: const EdgeInsets.all(14.0),
              child: Form (
                key: _formkey ,
                autovalidate: _validate,
                //autovalidateMode: AutovalidateMode.always,
                child: Container(
                  padding: const EdgeInsets.only(top:34.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 10,
                        fit: FlexFit.tight,
                        child: new Container(
                          //height: 596,
                          width:330,
                          child: Card(
                            //   margin: EdgeInsets.only(top: 100.0,right: 25.0,left: 25.0),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)
                            ),
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(27.0),
                                // mainAxisAlignment: MainAxisAlignment.start,
                                child: Column(
                                  children: <Widget>[

                                    Container(
                                      height:29,
                                      width:218,
                                      child: Text("Join the Katapult", style: TextStyle(color: Color(0xff4C0096),fontSize: 24.0,fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    new TextFormField(
                                      controller: _nameController,
                                      validator: validateName,
                                      keyboardType: TextInputType.name,
                                      onChanged: (val) {
                                        _name = val;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Name",
                                        hintStyle: TextStyle(
                                          color: Color(0xffCCCCCC),
                                          fontSize: 12,
                                          fontFamily: "Montserrat",
                                        ),

                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                    new TextFormField(
                                      controller: _emailController,
                                      validator: validateEmail,
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (val) {
                                        _email = val;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                          color: Color(0xffCCCCCC),
                                          fontSize: 12,
                                          fontFamily: "Montserrat",
                                        ),

                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                    new TextFormField(
                                      controller: _mobileController,
                                      validator: validateMobile,
                                      keyboardType: TextInputType.number,
                                      onChanged: (val) {
                                        _mobile = val;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Mobile Number",
                                        hintStyle: TextStyle(
                                          color: Color(0xffCCCCCC),
                                          fontSize: 12,
                                          fontFamily: "Montserrat",
                                        ),

                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                    new TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      validator: validatePassword,

                                      onChanged: (val) {
                                        _password = val;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          color: Color(0xffCCCCCC),
                                          fontSize: 12,
                                          fontFamily: "Montserrat",
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    new TextFormField(
                                      controller: _confirmPasswordController,
                                      obscureText: true,
                                      validator: (confirmation) {
                                        return confirmation.isEmpty
                                            ? 'Confirm password is required *'
                                            : validationEqual(confirmation, _passwordController.text) ? null : 'Password not match';
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        hintStyle: TextStyle(
                                          color: Color(0xffCCCCCC),
                                          fontSize: 12,
                                          fontFamily: "Montserrat",
                                        ),
                                      ),
                                      onChanged: (val){
                                        _confirmpassword = val;
                                      },
                                    ),

                                    SizedBox(height: 25,),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        _sendToServer()
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
                                        padding: EdgeInsets.symmetric(vertical: 18,),
                                        decoration: BoxDecoration(
                                            color: Color(0xffB71570),
                                            borderRadius: BorderRadius.  circular(15)
                                        ),
                                        alignment:Alignment.center,

                                        child:Text("SIGNUP",style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12,fontFamily: 'Montserrat'),),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("Or",style: TextStyle(fontSize: 12,color: Color(0xff333333),fontFamily: 'Montserrat'),),
                                    SizedBox(height: 5,),
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
                                                      Text("Signup With Facebook",style: new TextStyle(
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
                                                      Text("Signup With Google    ",style: new TextStyle(
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
                                              Text("  We recommend using Facebook or Google,", style: TextStyle(color: Colors.black,
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
                                    "Already have an Account?",
                                    style: new TextStyle(color: Color(0xffFFFFFF),fontSize: 12,fontFamily: 'Montserrat'),
                                  ),
                                  // SizedBox(height:5,),
                                  new GestureDetector(
                                    onTap: ()
                                    {
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder: (context) => LoginScreen()
                                      ));
                                    },
                                    child: new Text(
                                      "LOGIN",

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
  @override
  void dispose() {
    if (this.mounted) super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileController.dispose();
    _nameController.dispose();

  }
  _sendToServer() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      signupUser(_email, _password,_mobile,_name);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Email is required *';
    } else if (!regExp.hasMatch(value)) {
      return 'please enter valid email address';
    } else {
      return null;
    }
  }
  String validatePassword(String value) {
    Pattern pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required *";
    } else if (value.length < 8) {
      return 'Confirm password must be at least 8 characters';
    }
    else if (!regex.hasMatch(value))
      return 'Password required: Alphabet, Numbers';
    else
      return null;
  }
  String validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Confirm password is required *';
    } else if (value.length < 4) {
      return 'Confirm password must be at least 4 characters';
    }
    return null;
  }
  bool validationEqual(String currentValue, String checkValue) {
    if (currentValue == checkValue) {
      return true;
    } else {
      return false;
    }
  }
  String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.replaceAll(" ", "").isEmpty) {
      return 'Mobile is required *';
    } else if (value.replaceAll(" ", "").length != 10) {
      return 'Mobile number must be 10 digits';
    } else if (!regExp.hasMatch(value.replaceAll(" ", ""))) {
      return 'Mobile number must be digits';
    }
    return null;
  }
  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*).{3,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Name is required *';
    } else if (value.length<4) {
      return 'Name must be between 8-12 characters';
    }
    else if(value.length>12){
      return 'Name should not exceed 12 characters';
    }
    return null;
  }

}
