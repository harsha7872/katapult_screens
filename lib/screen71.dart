import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'MainPage_11.dart';
import 'categorypage(7).dart';
import 'constants.dart';
import 'forum_68.dart';

class Screen71 extends StatefulWidget {
  @override
  _Screen71State createState() => _Screen71State();
}

class _Screen71State extends State<Screen71> {
  SharedPreferences logindata;
  String username;
  @override
  void initState() {
    //this._getUsers();

    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }
  Future<void> userCat(String userName, String userCategory ) async {
    final response = await http.post(Constant.base_url+'userCat', headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'userName': userName,
      'userCategory': userCategory,

    });

    try {
      if (response.statusCode == 201) {
        print(response.body);
        return Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>Screen68()));
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
  TextEditingController _category= new TextEditingController();
  String _ques;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff707070),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                fit: BoxFit.cover)),
        child:Container(
          color: Color(0xffFFFFFF).withOpacity(0.95),
          child: Container(
            margin: EdgeInsets.only(left:17.0,right:17.0,bottom:15.0,top:10.0),
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Color(0xff3644BA),
                                //margin: EdgeInsets.all(30.0),
                                margin: EdgeInsets.all(8),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Container(
                                    // padding: EdgeInsets.all(10.0),
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              Navigator.pushReplacement(context, MaterialPageRoute(
                                                  builder: (context) =>Screen1()));
                                            },
                                            icon: Icon(Icons.arrow_back,color: Colors.white,size: 15,),
                                          ),
                                          Icon(Icons.home,color: Colors.white,)
                                        ],
                                      ),
                                    ),

                                  ),
                                  // mainAxisAlignment: MainAxisAlignment.start,

                                ),
                              ),
                              Card(
                                color: Color(0xff16C5BE),
                                //margin: EdgeInsets.all(30.0),
                                margin: EdgeInsets.all(8),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)
                                ),
                                child: Center(
                                  child: Container(
                                    // padding: EdgeInsets.all(10.0),
                                    child:
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.arrow_back,color: Colors.white,size: 15,),
                                          ),
                                          Text('Back', style: TextStyle(color: Color(0xffFFFFFF),
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 16),)
                                        ],
                                      ),
                                    ),

                                  ),
                                  // mainAxisAlignment: MainAxisAlignment.start,

                                ),
                              ),
                            ],),
                        ]
                    ),
                  ),
                  Align(
                    //alignment: Alignment.topRight ,
                    child: Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
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
                                      image: NetworkImage(
                                          Constant.base_url+'getPdfFile/Ellipse 2'),
                                    )

                                ),

                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                width: 200,
                                height: 50,
                                child:  TextFormField(
                                  autofocus: false,
                                  controller: _category,
                                  validator: validateEmail,
                                  onChanged: (value) => _ques = value,
                                  decoration: new InputDecoration(
                                    contentPadding: const EdgeInsets.all(16.0),
                                    hintText: '|   Categories',
                                    hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),
                                    //prefixIcon: _prefixIcon( Icons.email),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none),
                                  //  filled: true,
                                    //fillColor: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 50.0,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            userCat(username,_ques);
                          },
                        child: Card(
                          color: Color(0xffFFFFFF),
                          //margin: EdgeInsets.all(30.0),
                          margin: EdgeInsets.all(8),
                          elevation: 5,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              side: BorderSide(color: Color(0xff707070))
                          ),
                          child: Center(
                            child: Container(

                              child: Padding(
                                  padding: const EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),
                                  child:
                                  Text("Submit", style: TextStyle(color: Color(0xff707070),
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 12),)

                              ),
                            ),
                          ),

                        ),
                      ),
                      ]
                  ), //



                ]

            ),
          ),
        ),
      ),




    );
  }
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
