import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katapult_screens/search.dart';
import 'MainPage_11.dart';
import 'MultiplayerLifeline_35.dart';
import 'constants.dart';
class Screen34 extends StatefulWidget {
  String username;
  String email;
  int correct,fifty,multiplier;
  @override
  _Screen34State createState() => _Screen34State();
  Screen34(this.username,this.email,this.correct,this.fifty,this.multiplier);
}
class _Screen34State extends State<Screen34> {
  String requestmode;
  List<String> requestcategory= [];
String email;
int correct,fifty,multiplier;
String traditional = "Traditional \nGame";
String marathon = "Marathon \nGame";
String LastMan ="Last Man Standing \nGame";

  @override
  Widget build(BuildContext context) {
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
          child:Container(
            color: Color(0xff13BBAA).withOpacity(0.80),
            padding: EdgeInsets.all(10.0),
            child:  Column(
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
                                            child:  Image.network(Constant.base_url+"getPdfFile/Search"))
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
                    SizedBox(height: 20.0,),
            Flexible(
                flex: 8,
                fit: FlexFit.tight,
                child: Container(
                      /*height: 644,
                      width: 341,*/
                      child: Card(
                        color: Color(0xff99CFD6).withOpacity(0.40),
                        //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Center(

                          child: Column(
                              children: [
                                SizedBox(height: 15.0,),
                                Text("Select  Multiplayer \n     Match Style",style: TextStyle(color: Color(0xffFFFFFF),
                                  fontSize: 24,
                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                SizedBox(height: 20,),
                                Container(

                                  height:93 ,
                                  width: 295,
                                  child: Card(
                                    color: Color(0xffD6E2FB).withOpacity(0.40),
                                    elevation: 10.0,
                                    //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular (10.0)
                                    ),
                                    child: InkWell(
                                      onTap:(){

                                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) => Screen35(widget.username,widget.email,widget.correct,widget.fifty,widget.multiplier,traditional),
                                        ));
                                      },
                                      child: new Container(
                                        padding: EdgeInsets.all(20.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children:[
                                              Image.network(Constant.base_url+'getPdfFile/Traditional Game',),
                                              //SizedBox(width: 30,),
                                              Text(traditional,style: TextStyle(color: Color(0xff3844BD),
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                              SizedBox(width: 75,),
                                              Align(

                                                  alignment: Alignment.topLeft,
                                                  child: Tooltip(
                                                      showDuration: Duration(seconds: 12),
                                                      padding: EdgeInsets.all(10),
                                                      height: 40,
                                                      textStyle: TextStyle(
                                                          fontSize: 8, color: Colors.white, fontWeight: FontWeight.normal),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10), color: Color(0xff3644BA)),
                                                      message: '• 2 – 4 players \n• 1 Match \n• 5 Questions each match \n• Single category \n• Ante of 50 Initial chips \n• 1 tie breaker question at the end of the 5 questions \n• Person with most number of chips at the end of the\n match is the winner',
                                                      child: Icon(Icons.info)
                                                  )
                                              ),



                                            ],
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  height:93 ,
                                  width: 295,
                                  child: Card(
                                      color: Color(0xffD6E2FB).withOpacity(0.40),
                                      elevation: 10.0,
                                      //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular (10.0)
                                      ),
                                      child: InkWell(
                                        onTap:(){

                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (context) => Screen35(widget.username,email,widget.correct,widget.fifty,widget.multiplier,marathon),
                                          ));
                                        },
                                        child:new Container(
                                          padding: EdgeInsets.all(20.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children:[
                                                Image.network(Constant.base_url+'getPdfFile/Marathon Game',),
                                                ///SizedBox(width: 30,),
                                                Text(marathon,style: TextStyle(color: Color(0xff3844BD),
                                                  fontSize: 16,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                                SizedBox(width: 75,),
                                                Align(

                                                    alignment: Alignment.topLeft,
                                                    child: Tooltip(
                                                        showDuration: Duration(seconds: 12),
                                                        padding: EdgeInsets.all(10),
                                                        height: 40,
                                                        textStyle: TextStyle(
                                                            fontSize: 8, color: Colors.white, fontWeight: FontWeight.normal),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10), color: Color(0xff3644BA)),
                                                        message: '• 2 – 4 players \n• Three matches \n• 5 Questions in each match \n• Multiple category \n• Ante of 100 Initial chips \n• 1 tiebreaker question at the end of the 3rd match \n• Person with most number of chips at the end of the 3 \n matches is the winner',
                                                        child: Icon(Icons.info)
                                                    )
                                                ),



                                              ],
                                            ),

                                          ),
                                        ),)
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  height:93 ,
                                  width: 295,
                                  child: Card(
                                      color: Color(0xffD6E2FB).withOpacity(0.40),
                                      elevation: 10.0,
                                      //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular (10.0)
                                      ),
                                      child:InkWell(
                                        onTap:(){

                                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (context) => Screen35(widget.username,email,widget.correct,widget.fifty,widget.multiplier,LastMan),
                                          ));
                                        },
                                        child: new Container(
                                          padding: EdgeInsets.all(20.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children:[
                                                Image.network(Constant.base_url+'getPdfFile/Last Man Standing Game',),
                                                //SizedBox(width: 30,),
                                                Text(LastMan,style: TextStyle(color: Color(0xff3844BD),
                                                  fontSize: 16,
                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                                SizedBox(width: 8,),
                                                Align(

                                                    alignment: Alignment.topLeft,
                                                    child: Tooltip(
                                                        showDuration: Duration(seconds: 12),
                                                        padding: EdgeInsets.all(10),
                                                        height: 40,
                                                        textStyle: TextStyle(
                                                            fontSize: 8, color: Colors.white, fontWeight: FontWeight.normal),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10), color: Color(0xff3644BA)),
                                                        message: '• 2 – 4 players \n• 2 – 5 matches respectively \n• 5 Questions each match • Multiple category \n• Ante of 200 Initial chips \n• 1 tiebreaker question at the end of each match \n• One player, the one with the smallest number of chips,\n eliminated at the end each match',
                                                        child: Icon(Icons.info)
                                                    )
                                                ),



                                              ],
                                            ),

                                          ),
                                        ),)
                                  ),
                                )
                              ]
                          ),

                        ),
                      ),
                    ),
            ),

                  ]

              ),

          ),
        ),
      ),



    );
  }
}
class User {
  final int id;
  final int parent_id;
  final String category;
  final int color;
  final bool isChecked;

  User(this.id,this.parent_id, this.category, this.color,this.isChecked);
}
