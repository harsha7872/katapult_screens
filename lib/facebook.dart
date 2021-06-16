import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
      home: FacebookPage(),
    );
  }
}
class FacebookPage extends StatefulWidget {
  @override
  _FacebookPageState createState() => _FacebookPageState();
}

class _FacebookPageState extends State<FacebookPage> {
  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _isLoggedIn
            ? Column(
          children: [
            Image.network(_userObj["picture"]["data"]["url"]),
            Text(_userObj["name"]),
            Text(_userObj["email"]),
            TextButton(
                onPressed: () {
                  FacebookAuth.instance.logOut().then((value) {
                    setState(() {
                      _isLoggedIn = false;
                      _userObj = {};
                    });
                  });
                },
                child: Text("Logout"))
          ],
        )
            : Center(
          child: ElevatedButton(
            child: Text("Login with Facebook"),
            onPressed: () async {
              FacebookAuth.instance.login(
                  permissions: ["public_profile", "email"]).then((value) {
                FacebookAuth.instance.getUserData().then((userData) {
                  setState(() {
                    _isLoggedIn = true;
                    _userObj = userData;
                  //  authen(id,_userObj["name"],_userObj["name"],_isLoggedIn);
                  });
                });
              });
            },
          ),
        ),
      ),
    );
  }
}