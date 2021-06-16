import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/search.dart';
import 'package:katapult_screens/socketprovider.dart';
import 'package:provider/provider.dart';
import 'MainPage_11.dart';
import 'MatchMode_36.dart';
import 'constants.dart';

class Screen35 extends StatefulWidget {
  String username;
  String email,matchmode;
  int correct,fifty,multiplier;
  @override
  _Screen35State createState() => _Screen35State();
  Screen35(this.username,this.email,this.correct,this.fifty,this.multiplier,this.matchmode);
}

class _Screen35State extends State<Screen35> {
  String requestmode;
  List<String> requestcategory= [];
  String email;
  String matchmode;
  String to="harshi1@gmail.com";
  String names = "Harshitha";
  String gmail = "harshi1@gmail.com";
  Widget displayAlert(ctx1){
    return Card(
        child: Row(
            children:[
                Text("hi"),
                FlatButton(
                    child: Text("NO"),
                    onPressed: () {
                        // movies.sendResponse(reject,name);
                        Navigator.pop(ctx1);
                        //widget.socket.emit('rejected', 'rejected');
                    },
                ),
            ]
        ),
    ); /*AlertDialog(
      content: Text(Provider.of<Testing>(context).message),
      actions: <Widget>[
        FlatButton(
          child: Text("YES"),
          onPressed: () {
            // movies.sendResponse(accept,email);
            *//*  Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Simple()));*//*
            //widget.socket.emit('accepted', 'accepted');
          },
        ),
        FlatButton(
          child: Text("NO"),
          onPressed: () {
            // movies.sendResponse(reject,name);
            Navigator.pop(context);
            //widget.socket.emit('rejected', 'rejected');
          },
        ),
      ],
      // ignore: missing_return, missing_return, missing_return, missing_return
    );*/
  }
  @override
  Widget build(BuildContext ctx) {
print(widget.email);
    return Scaffold(
      body:SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                    fit: BoxFit.cover)),
            child:Consumer<Testing>(
              builder:(BuildContext context,movies,child){
                if (movies.message != null) {
                   return displayAlert(ctx);

                }
                else{
                return Container(
                color: Color(0xff13BBAA).withOpacity(0.80),
                padding: EdgeInsets.all(10.0),
                child: Column(
                children: [
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
                Constant.base_url+"getPdfFile/anand"),
                )

                ),

                )
                ],
                ),
                Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start,
                children: [
                Text("Hi ${widget.username},",
                style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),),
                SizedBox(height:5.0),
                Text("Its time to play!",
                style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 10,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500),),
                ],
                ),
                SizedBox(width: 40.0),
                Column(
                children: [
                Image.network(Constant.base_url+"getPdfFile/Message")
                ],
                ),
                SizedBox(width:0.0),
                Column(
                children: [

                GestureDetector(
                onTap:(){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Search()
                ));
                },
                child: Image.network(Constant.base_url+"getPdfFile/Search"))
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
                SizedBox(height: 10.0,),
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
                Icons.arrow_back,size:12, color: Colors.white,)
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

                SizedBox(height: 5.0,),
                Flexible(
                flex: 8,
                fit: FlexFit.tight,
                child:Container(
                child: Card(
                color: Color(0xff99CFD6).withOpacity(0.40),
                //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)
                ),
                child: Center(
                child: Column(
                children: [
                SizedBox(height: 30,),
                Container(
                height: 476,
                width: 341,
                child: Align(
                alignment:
                Alignment.center
                ,
                child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Column(
                children: [
                Text("Lifeline you have\n   remaining", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,
                fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                SizedBox(height:20.0),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Column(
                children:[
                Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                Constant.base_url+"getPdfFile/correct"),
                )

                ),

                ),

                ]
                ),
                Column(
                children: [
                Text("  Available :${widget.correct}", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 19,
                fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                ],
                ),

                ],
                ),

                SizedBox(height:20.0),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Constant.base_url+"getPdfFile/fiftyfifty"),
                )

                ),

                )
                ],
                ),
                Column(
                children: [
                Text('Available :${widget.fifty}', style: TextStyle(color: Color(0xffFFFFFF),
                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 19),),
                ],
                ),
                ],
                ),

                SizedBox(height:20.0),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Column(
                children: [
                Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.only(top: 30.0,bottom: 100.0),
                decoration: BoxDecoration(
                //shape:BoxShape.circle,
                image:DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                Constant.base_url+"getPdfFile/3x"),
                )

                ),

                )
                ],
                ),
                Column(
                children: [
                Text('Available :${widget.multiplier}', style: TextStyle(color: Color(0xffFFFFFF),
                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 19),),
                ],
                ),
                ],
                ),

                SizedBox(height:30.0),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                Column(
                children: [
                RaisedButton(
                color: Color(0xff0A6E75),
                textColor: Colors.white,
                padding: const EdgeInsets.only(left: 35,right: 34,top: 17,bottom: 17),
                child: Text("Buy More".toUpperCase(),style: TextStyle( fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12, ),),
                onPressed: (){},
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
                ),


                ],),
                Column(
                children: [
                RaisedButton(
                color: Color(0xff0A6E75),
                textColor: Colors.white,
                padding: const EdgeInsets.only(left: 35,right: 34,top: 17,bottom: 17),
                child: Text("proceed".toUpperCase(),style: TextStyle( fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),
                onPressed: (){
               /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Screen36(widget.username,widget.email,widget.correct,widget.fifty,widget.multiplier,matchmode)
                ));*/
                  movies.sendInvites(gmail, to, names);
                },
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
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
                )
                ]

                ),

                );
                }
              }

            ),


          )
      ),
    );
  }
}