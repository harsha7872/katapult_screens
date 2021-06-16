import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
      "530753356607-v9o0fh3lihn6qt4bgsh5tr719lfqobcr.apps.googleusercontent.com");
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Sign in with Google!",
            style: TextStyle(fontSize: 30),
          ),
          RaisedButton(
            onPressed: () {
              statrSignIn();
            },
            child: Text('Tap to sign in'),
          ),
        ],
      ),
    );
  }

  void statrSignIn() async {
    await googleSignIn.signOut(); //optional
    GoogleSignInAccount user = await googleSignIn.signIn();
    if (user == null) {
      print('Sign In Failed ');
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }
}