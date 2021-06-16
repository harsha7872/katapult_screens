import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/screen_8.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:sizer/sizer.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'User.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizerUtil().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sizer',
              theme: ThemeData.light(),
              home: MyHomePage(),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Object get height1 => MediaQuery.of(context).size.height;
  Object get width1 => MediaQuery.of(context).size.width;
  bool selected = false;
  var userStatus = List<bool>();
  SharedPreferences logindata;
  String username;
  @override
  void initState() {
    this._getUsers();
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }
  Future<List<User>> _getUsers() async {
    var data = await http
        .get(Constant.base_url);

    var jsonData = json.decode(data.body);
    var fetch = jsonData["recordset"];

    List<User> users = [];

    for (var u in fetch) {
      User user =
      User(u["id"],u["parent_id"], u["category"], u["color"],u["isChecked"],);

      users.add(user);
      userStatus.add(false);
    }

    print(users.length);

    return users;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child: Container(
            height:  height1,
            width: width1,

            color: Color(0xff3555C9).withOpacity(0.80),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                //height: (761/SizeConfig.heightMultiplier)*SizeConfig.heightMultiplier,
                width:90.0.w,
                child: Card(
                    color: Color(0xff5095E4).withOpacity(0.40),
                    margin: EdgeInsets.all(6.0.w),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child:Container(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Select Favourite Topics",style: TextStyle(color: Colors.white,fontSize: 18,
                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                          ),
                          Text("Select minimum 5 topics/subtopic",style: TextStyle(color: Colors.white,fontSize: 10,
                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                          FutureBuilder(
                            future: _getUsers(),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              print(snapshot.data);
                              if (snapshot.data == null) {
                                return Container(child: Center(child: Text("")));
                              } else {
                                return GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 20,),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return new Container(
                                      child: new Center(
                                        child: new Column(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                         //     padding: EdgeInsets.only(top: 1.0.h,left: 0.5.h,right: 0.5.h,),
                                              child: Card(
                                                color: Color(snapshot.data[index].color),
                                                shape: new RoundedRectangleBorder(
                                                    borderRadius: new BorderRadius.circular(5.0)
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      builder: (context) => Screen8(snapshot.data[index],),
                                                    ));
                                                  },
                                                  child: new Container(
                                                    height: 7.0.h,
                                                    width: 13.5.w,
                                                    child:Image.network(Constant.base_url+'getPdfFile/${snapshot.data[index].category}'),

                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(snapshot.data[index].category, style: TextStyle(fontSize: 8,color: Colors.white,),
                                            ),

                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    )


                ),
              ),
            ),
          ),

        )
    );
  }

}










