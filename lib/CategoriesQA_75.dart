import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:katapult_screens/screen76.dart';

import 'MainPage_11.dart';
import 'constants.dart';


class Screen75 extends StatefulWidget {
  @override
  _Screen75State createState() => _Screen75State();
}

class _Screen75State extends State<Screen75> {

  @override

  // ignore: must_call_super
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                  fit: BoxFit.cover)),
          child:Container(
            color: Color(0xff3A0080).withOpacity(0.77),
            padding: EdgeInsets.all(10.0),

            child:  Column(
              children: [
                SizedBox(height: 20.0,),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Row(
                    children:[
                      Flexible(
                        child: Card(
                          color: Color(0xffAB75EB) ,

                          //margin: EdgeInsets.all(30.0),
                          // margin: EdgeInsets.only(right: 250, top: 10.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)
                          ),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                          Icons.arrow_back,size: 12, color: Colors.white,)
                                    ),
                                  ),
                                  SizedBox(width: 5.0,),
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
                SizedBox(height: 10.0,),
                Flexible(
                  flex:9,
                  fit:FlexFit.tight,
                  child: Container(
                    // height: 683,
                    //width: 341,

                    child: Card(
                      color: Color(0xffAB75EB).withOpacity(0.40),
                      //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Text("Categories",style: TextStyle(color:Color(0xffFFFFFF),fontSize: 24,fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("History",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                                              builder: (context) => Screen76(),
                                              ));*/

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Indian History",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                            //));

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height:5,),
                              Padding(
                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Cars",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                            //));

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Planet Earth",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                            //));

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Physics",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                            //));

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Maths",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                            //));

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Film and Entertainment",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                            //));

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Game of Thrones",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                            //));

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: EdgeInsets.only(left:7.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Dragon Ball",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                            //));

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: EdgeInsets.only(left:9.0,right: 7.0),
                                child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        // width: 134,
                                        //height: 15,
                                          padding: EdgeInsets.all(5.0),
                                          child: Text("Medical",style: TextStyle(fontSize: 8.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                    ],),
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 2,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(50.0),
                                          side: BorderSide( color: Color(0xff0D3B9B)),
                                        ),
                                        child: InkWell(
                                          onTap:(){
                                            //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            //  builder: (context) => Screen9(snapshot.data[index],widget.user.category),
                                            //));

                                          },
                                          child:Container(
                                              height: 19,
                                              width: 19,
                                              child: Icon(Icons.arrow_forward,size: 15,color: Color(0xff3644BA),)
                                          ),
                                        ),
                                      ),
                                    ],
                                  )


                                ],
                              ),




                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
