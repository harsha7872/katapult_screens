import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
      "530753356607-v9o0fh3lihn6qt4bgsh5tr719lfqobcr.apps.googleusercontent.com");

  GoogleSignInAccount account;
  GoogleSignInAuthentication auth;
  bool gotProfile = false;

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return gotProfile
        ? Scaffold(
      appBar: AppBar(
        title: Text(" Your Profile "),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await googleSignIn.signOut();
                await googleSignIn.disconnect();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            account.photoUrl,
            height: 50,
          ),
          Text(account.displayName),
          Text(account.email),
          // Text(auth.idToken)
        ],
      ),
    )
        : LinearProgressIndicator();
  }

  void getProfile() async {
    await googleSignIn.signInSilently();
    account = googleSignIn.currentUser;
    auth = await account.authentication;
    setState(() {
      gotProfile = true;
    });
  }
}