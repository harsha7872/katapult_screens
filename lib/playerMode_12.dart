import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MainPage_11.dart';
import 'constants.dart';


class MyHomePage extends StatefulWidget {
  String username;
  @override
  _MyHomePageState createState() => _MyHomePageState();
  MyHomePage(this.username);

}
class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff3555C9) ,
      body:SingleChildScrollView(
        child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
         image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
           fit: BoxFit.cover)),

          child: Container(
           color: Color(0xff3555C9).withOpacity(0.80),
            child:Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                 children: [
                   Align(
                    alignment: Alignment.topRight ,
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
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
                                      image: NetworkImage(Constant.base_url+"getPdfFile/anand"),
                                    )

                                ),

                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hi ${widget.username},", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,
                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                              SizedBox(height:5.0),
                              Text("Its time to play!",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,
                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            ],
                          ),
                          SizedBox(width:100.0),
                          Column(
                            children: [
                              Image.network(Constant.base_url+"getPdfFile/Message")
                            ],
                          ),
                          SizedBox(width:0.0),
                          Column(
                            children: [
                              Image.network(Constant.base_url+"getPdfFile/Search")
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Card(
                    color: Color(0xff3644BA) ,
                    //margin: EdgeInsets.all(30.0),
                   margin: EdgeInsets.only(right: 250,top: 10.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child: Center(
                      child: Container(
                        height:53 ,
                      width: 82,
                      // padding: EdgeInsets.all(10.0),
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
                  SizedBox(height: 5.0,),
              Container(
                height: 540,
                width: 341,
                child: Card(
                  color: Color(0xff5095E4),
                  //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)
                  ),
                  child: Center(

                    child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Align(
                            alignment: Alignment.topCenter  ,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.0),
                              child: Column(
                                children: [
                                  Text("Select Player Mode", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,
                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 178,
                            width: 231,
                            child: Card(
                              color: Color(0xffD6E2FB),
                              elevation: 10.0,
                              //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular (10.0)
                              ),
                              child: new Container(
                                padding: EdgeInsets.all(30.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      ClipRRect(
                                        borderRadius: new BorderRadius.circular (30.0),
                                      ),
                                      Image.network(Constant.base_url+"getPdfFile/Multi Player"),
                                      Text( "Multi Player",style: TextStyle(color: Color(0xff3844BD),fontSize: 24,
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),

                                    ],
                                  ),

                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(
                            height:178 ,
                            width: 231,
                            child: Card(
                              color: Color(0xffD6E2FB),
                              elevation: 10.0,
                              //margin: EdgeInsets.only(top: 20.0,bottom: 60.0,right: 90.0,left: 90.0),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular (10.0)
                              ),
                              child: new Container(
                                padding: EdgeInsets.all(30.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      ClipRRect(
                                        borderRadius: new BorderRadius.circular (30.0),
                                      ),
                                      Image.network(Constant.base_url+"getPdfFile/Single"),
                                      Text( "single Player",style: TextStyle(color: Color(0xff3844BD),fontSize: 20,
                                          fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),

                                    ],
                                  ),

                                ),
                              ),
                            ),
                          )
                        ]
                    ),

                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    )
    )
    );
  }
}


