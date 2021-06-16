
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:katapult_screens/socketprovider.dart';
import 'package:provider/provider.dart';
import '26popup.dart';
import '26popup_content.dart';
import 'MainPage_11.dart';
import 'SingleplayerCategory_18.dart';
import 'constants.dart';
class Screen17 extends StatefulWidget {
  String username;
  String email;
  int correct,fifty,multiplier;
  @override
  _Screen17State createState() => _Screen17State(this.username,this.email,this.correct,this.fifty,this.multiplier);
  Screen17(this.username,this.email,this.correct,this.fifty,this.multiplier,);
}
class _Screen17State extends State<Screen17> {
  String requestmode;
  List<String> requestcategory= [];
//  Object get height1 => MediaQuery.of(context).size.height;
  //Object get width1 => MediaQuery.of(context).size.width;
  int counter = 0;
  int correct,fifty,multiplier;
  String username;
  String email;
  List<String> selectedlist = [];
  _Screen17State(this.username,this.email,this.correct,this.fifty,this.multiplier,);
  String to="harshi1@gmail.com";
  String names = "Harshitha";
  String gmail = "harshi1@gmail.com";

  @override
  Widget build(BuildContext context) {

       return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          moveToLastScreen();
        },
        child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
              /*  width: width1,
                height: height1,*/
                constraints: BoxConstraints.expand(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            Constant.base_url + "getPdfFile/bcImg"),
                        fit: BoxFit.cover)),
                child:      Container(
                  color: Color(0xffBB138A).withOpacity(0.80),
                  child: Consumer<Testing>(
                    builder:(ctx,movies,child){
                      if (movies.message != null) {
                        return displayAlert(ctx);
                      }
                    else{
                      return Container(
                      //margin: EdgeInsets.only(top:16.0,bottom: 149,right:16,left:16),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      SizedBox(height: 10.0,),
                      Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                      child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Align(
                      alignment: Alignment.topRight,
                      child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly,
                      children: [
                      Column(
                      children: [
                      Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.only(
                      top: 30.0, bottom: 100.0),
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                      Constant.base_url +
                      "getPdfFile/anand"),
                      )

                      ),

                      )
                      ],
                      ),
                      Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start,
                      children: [
                      Text("Hi ",
                      style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight
                          .w600),),
                      SizedBox(height: 5.0),
                      Text("Its time to play!",
                      style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight
                          .w500),),
                      ],
                      ),
                      SizedBox(width: 30.0),
                      Column(
                      children: [
                      GestureDetector(
                      onTap: () {
                      /* Navigator.of(context)
                                                        .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Screen14()
                                                        ));*/
                      /* setState(() {
                                                      counter = 0;
                                                    });*/
                      },
                      child: new Stack(
                      children: <Widget>[
                      new Image.network(
                      Constant.base_url +
                      "getPdfFile/Message",
                      height: 21,),
                      counter != 0
                      ? new Positioned(
                      left: 21,
                      bottom: 10,
                      child: new Container(
                      padding: EdgeInsets.all(
                      1),
                      decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius
                          .circular(6),
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
                      textAlign: TextAlign
                          .center,
                      ),
                      ),
                      )
                          : new Container()
                      ],
                      ),
                      ),
                      ],
                      ),


                      SizedBox(width: 0.0),
                      Column(
                      children: [
                      Image.network(Constant.base_url +
                      "getPdfFile/Search")
                      ],
                      )

                      ],
                      ),
                      ),
                      ),
                      ],
                      ),
                      ), //Container
                      ),

                      ///Flexible
                      SizedBox(height: 5.0,),
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
                      borderRadius: new BorderRadius.circular(
                      10.0)
                      ),
                      child: Center(
                      child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center,
                      children: [
                      Flexible(
                      child: GestureDetector(
                      onTap: () {
                      Navigator.of(context)
                          .pushReplacement(
                      MaterialPageRoute(
                      builder: (
                      context) =>
                      Screen1()
                      ));
                      },
                      child: Icon(
                      Icons.arrow_back, size: 12,
                      color: Colors.white,)
                      ),
                      ),
                      SizedBox(width: 5.0,),
                      Flexible(
                      child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                      Icons.home,
                      color: Colors.white,)),
                      )
                      ],
                      ),


                      // mainAxisAlignment: MainAxisAlignment.start,

                      ),
                      ),
                      ),
                      ),
                      Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(

                      )
                      )
                      ],
                      ),
                      ),

                      SizedBox(height: 5.0,),
                      Flexible(
                      flex: 7,
                      fit: FlexFit.tight,
                      child: Container(
                      // height: (476/SizeConfig.heightMultiplier)*SizeConfig.heightMultiplier.to Int(),
                      //width:(341/SizeConfig.widthMultiplier)*SizeConfig.widthMultiplier.toInt(),
                      child: Card(
                      color: Color(0xffF17EDC).withOpacity(0.40),
                      //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                      shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(
                      10.0)
                      ),
                      child: Center(
                      child: Column(
                      children: [
                      SizedBox(height: 30,),
                      Container(
                      //height: 476,
                      //width: 341,
                      child: Align(
                      alignment: Alignment.center,
                      child: Container(
                      margin: EdgeInsets.only(
                      top: 10.0),
                      child: Column(
                      children: [
                      Text(
                      "Lifeline you have\n    remaining",
                      style: TextStyle(
                      color: Color(
                      0xffFFFFFF),
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight
                          .w700),),
                      SizedBox(height: 20.0),
                      Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly,
                      children: [
                      Column(
                      children: [
                      Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets
                          .only(
                      top: 30.0,
                      bottom: 100.0),
                      decoration: BoxDecoration(
                      shape: BoxShape
                          .circle,
                      image: DecorationImage(
                      fit: BoxFit
                          .fill,
                      image: NetworkImage(
                      Constant
                          .base_url +
                      "getPdfFile/correct"),
                      )

                      ),

                      ),

                      ]
                      ),
                      Column(
                      children: [
                      Text(
                      "  Available :0}",
                      style: TextStyle(
                      color: Color(
                      0xffFFFFFF),
                      fontSize: 19,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight
                          .w600),),
                      ],
                      ),

                      ],
                      ),

                      SizedBox(height: 20.0),
                      Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly,
                      children: [
                      Column(
                      children: [
                      Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets
                          .only(top: 30.0,
                      bottom: 100.0),
                      decoration: BoxDecoration(
                      shape: BoxShape
                          .circle,
                      image: DecorationImage(
                      fit: BoxFit
                          .fill,
                      image: NetworkImage(
                      Constant
                          .base_url +
                      "getPdfFile/fiftyfifty"),
                      )

                      ),

                      )
                      ],
                      ),
                      Column(
                      children: [
                      Text(
                      'Available :0',
                      style: TextStyle(
                      color: Color(
                      0xffFFFFFF),
                      fontSize: 19,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight
                          .w600),),
                      ],
                      ),
                      ],
                      ),

                      SizedBox(height: 20.0),
                      Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly,
                      children: [
                      Column(
                      children: [
                      Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets
                          .only(top: 30.0,
                      bottom: 100.0),
                      decoration: BoxDecoration(
                      shape: BoxShape
                          .circle,
                      image: DecorationImage(
                      fit: BoxFit
                          .fill,
                      image: NetworkImage(
                      Constant
                          .base_url +
                      "getPdfFile/3x"),
                      )

                      ),

                      )
                      ],
                      ),
                      Column(
                      children: [
                      Text(
                      'Available :0',
                      style: TextStyle(
                      color: Color(
                      0xffFFFFFF),
                      fontSize: 19,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight
                          .w600),),
                      ],
                      ),
                      ],
                      ),

                      SizedBox(height: 30.0),
                      Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround,
                      children: [
                      Column(
                      children: [
                      RaisedButton(
                      color: Color(
                      0xffB71570),
                      textColor: Colors
                          .white,
                      padding: const EdgeInsets
                          .only(
                      left: 35,
                      right: 34,
                      top: 17,
                      bottom: 17),
                      child: Text(
                      "Buy More"
                          .toUpperCase(),
                      style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight
                          .w600,
                      color: Color(
                      0xffFFFFFF),
                      fontSize: 12,),),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius
                          .circular(
                      10.0)),
                      ),


                      ],),
                      Column(
                      children: [
                      RaisedButton(
                      color: Color(
                      0xffB71570),
                      textColor: Colors
                          .white,
                      padding: const EdgeInsets
                          .only(
                      left: 35,
                      right: 34,
                      top: 17,
                      bottom: 17),
                      child: Text(
                      "proceed"
                          .toUpperCase(),
                      style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight
                          .w600,
                      color: Color(
                      0xffFFFFFF),
                      fontSize: 12,),),
                      onPressed: () {
                      //  Hello();
                       Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                    builder: (context) => Screen18(widget.username,widget.email,widget.correct,widget.fifty,widget.multiplier,)
                                                                ));

                      /*final snackbar = SnackBar(
                                                                  content: Text('Hey! This is a SnackBar message.'),
                                                                  duration: Duration(seconds: 5),
                                                                  action: SnackBarAction(
                                                                    label: 'Undo',
                                                                    onPressed: () {
                                                                      // Some code to undo the change.
                                                                    },
                                                                  ),
                                                                );*/

                      movies.sendInvites(gmail, to, names);
                      // _showAlertDialog(context);
                      //Scaffold.of(context).showSnackBar(snackbar);
                      },
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius
                          .circular(
                      10.0)),
                      ),


                      ],),
                      ]
                      )


                      ],
                      ),
                      ),
                      ),
                      ),
                      ]
                      ),

                      ),
                      ),
                      ),
                      ),
                      Flexible(
                      flex: 2,
                      child: Container(

                      ),

                      ),
                      //  SizedBox(height: 150.0,),
                      ]

                      ),
                      );
                      }
                    }
                  ),
                ),
              )
          ),

        ),
      );}
    }

  void moveToLastScreen() {
   /* Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Screen1(),
    ));*/
  }
   displayAlert(BuildContext ctx){

   return  AlertDialog(
       content: Text(Provider.of<Testing>(ctx).message),
       actions: <Widget>[
         FlatButton(
           child: Text("YES"),
           onPressed: () {
             // movies.sendResponse(accept,email);
             /*  Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Simple()));*/
             //widget.socket.emit('accepted', 'accepted;
           },
         ),
         FlatButton(
           child: Text("NO"),
           onPressed: () {

             Navigator.of(ctx).pop();
             //Navigator.of(ctx, rootNavigator: true).pop();
             // WidgetsBinding.instance.addPostFrameCallback((_) {
             //   Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (_) => Screen17()));
             // });
             // movies.sendResponse(reject,name);
             //Navigator.of(ctx)..pop()..pop();
             //widget.socket.emit('rejected', 'rejected');
           },
         ),
       ],
       // ignore: missing_return, missing_return, missing_return, missing_return
     );

  }

 /* Future<dynamic> _showNotification(BuildContext context,String notification) async {
    try {
      //print(notification.title);
      await AlertDialog(
        title: new Icon(Icons.warning, size: 80.0, color: Colors.amber,),
        content: Text(notification),
        actions: <Widget>[
          FlatButton(
            child: Text('YES',style: TextStyle(color: Colors.red),),
            onPressed: () {
              *//* Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>Screen46(userDetails[0]["firstName"],selectedlist,"name1",widget.email,widget.correct,widget.fifty,widget.multiplier,"Traditional Game"),
            ));*//*
            },
          ),
          FlatButton(
            child: Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }  catch (e) {
      print(e.message);
    }
  }*/



