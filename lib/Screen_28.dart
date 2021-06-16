import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainPage_11.dart';
import 'constants.dart';



class Screen28 extends StatefulWidget {
  @override
  _Screen28State createState() => _Screen28State();
}

class _Screen28State extends State<Screen28> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xffBB138A),
      body:SingleChildScrollView(
        child: Container(
          height:812,
          width: 375,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child:Container(
            color: Color(0xffBB138A).withOpacity(0.80),
            child:Container(
              margin: EdgeInsets.all(8.0),

              child:Column(
                children: [
                  Card(
                    color: Color(0xff3644BA) ,
                    //margin: EdgeInsets.all(30.0),
                    margin: EdgeInsets.only(right: 260,top: 40.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child: Center(
                      child: Container(
                        //padding: EdgeInsets.all(4.0),
                        child: Column(
                          children:<Widget> [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back,size:12,color: Colors.white,),

                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => Screen1()
                                    ));
                                  },
                                ),
                                Icon(Icons.home,color: Colors.white,)
                              ],
                            ),
                          ],
                        ),
                        // mainAxisAlignment: MainAxisAlignment.start,

                      ),
                    ),
                  ),
                  SizedBox(height: 70,),
                  Container(
                    height:445 ,
                    width: 341,
                    child: Card(
                      color: Color(0xffF17EDC).withOpacity(0.40),
                      // margin: EdgeInsets.only(top: 10.0,bottom: 150.0,right: 25.0,left: 25.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      ),
                      child: Center(

                        child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text("Current Score: 0",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                        color: Color(0xffFFFFFF),fontSize: 10, ),),
                                    ],
                                  ),
                                  SizedBox(width: 150,),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Stack(
                                              alignment: Alignment.center,
                                              children: <Widget>[
                                                Image.network(Constant.base_url+"getPdfFile/ellipse6",height: 17,width: 17,),
                                                Text("K",style: TextStyle(color:Color(0xffFFFFFF),
                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 12),),
                                              ]
                                          ),
                                          SizedBox(width: 5,),
                                          Text("1000",style: TextStyle(fontSize: 12.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                        ],),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 50,),
                              Align(
                                alignment: Alignment.topCenter  ,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Text("        History, \nPolitical History,\n  British Empire", style:
                                      TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w700,color: Color(0xffFFFFFF),fontSize: 24,),),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 100,),
                              Align(
                                alignment: Alignment.topCenter  ,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Text("Question 1", style: TextStyle(fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 18,),),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 20,),
                              ButtonTheme(
                                buttonColor: Color(0xffB71570),
                                minWidth: 217.0,
                                height: 49.0,

                                child: RaisedButton(
                                  onPressed: () {
                                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    // builder: (context) => Screen28(),
                                    //));
                                  },
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0),
                                  ),
                                  child: Text("Pause Game".toUpperCase(),style:TextStyle(fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 12,),),

                                ),
                              ),
                              SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.center ,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    children: [
                                      Text("Quit", style: TextStyle(fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,color: Color(0xffFFFFFF),fontSize: 13,),),
                                    ],
                                  ),
                                ),
                              ),


                            ]
                        ),

                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


