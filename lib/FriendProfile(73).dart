import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'MainPage_11.dart';
import 'constants.dart';


class Screen73 extends StatefulWidget {
  String friendemail,friendname;

  @override
  _Screen73State createState() => _Screen73State(this.friendemail,this.friendname);
  Screen73(this.friendemail,this.friendname);
}
class _Screen73State extends State<Screen73> {
  String requestmode;
  List<String> requestcategory= [];
  String friendemail,friendname;
  _Screen73State(this.friendemail,this.friendname);

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
            padding: EdgeInsets.all(14.0),
            child:  Column(
              children: [
                Flexible(

                  child: Row(
                    children:[
                      Flexible(
                        flex:2 ,
                        fit: FlexFit.loose,
                        child: Card(
                          color: Color(0xffAB75EB),


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
                      ),
                      Flexible(
                          flex:2,
                          fit:FlexFit.tight,
                          child: Container(
                              child:
                              Image.network(Constant.base_url+"getPdfFile/Search")

                          )
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 20.0,),
                Flexible(
                  flex:11,
                  fit:FlexFit.tight,
                  child:SingleChildScrollView(
                    child: Container(
                      height: 1121,
                      width: 341,
                      child: Card(
                        color: Color(0xffAB75EB).withOpacity(0.40),
                        //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)
                        ),
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight ,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(

                                          children: [
                                            Container(
                                              width: 75,
                                              height: 75,
                                              //  padding: EdgeInsets.only(top: 10.0,),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image:DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(Constant.base_url+"getPdfFile/Ellipse 34"),
                                                  )

                                              ),

                                            ),
                                            SizedBox(height:5.0),
                                            Container(
                                              width: 55,
                                              height: 18,

                                              child:RaisedButton(
                                                  padding: EdgeInsets.zero,
                                                  color: Color(0xff6F79CC),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(100.0)
                                                  ),
                                                  child: Text("Un-Friend",style: TextStyle(fontSize: 5.0,color: Color(0xffFFFFFF),
                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                  onPressed: (){}
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width:10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Scarlett", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                            SizedBox(height:10),
                                            Text("Beginner \nLevel 2!",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                                          ],
                                        ),
                                        SizedBox(width:60),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.edit,color: Color(0xffFFFFFF),),
                                            SizedBox(height:10),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Image.network(Constant.base_url+"getPdfFile/india"),
                                                  Text("India",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 10,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),

                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Card(
                                  color:Color(0xff6F79CC),
                                  //  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 25.0,left: 25.0),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0),
                                      side: BorderSide(color:Color(0xff3644BA))
                                  ),
                                  child: Center(
                                    child: Column(
                                        children: [
                                          Container(
                                            height: 42,
                                            width: 300,
                                            // margin: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  padding:EdgeInsets.all(5.0),
                                                  child: Column(
                                                    ///mainAxisAlignment: MainAxisAlignment.start,
                                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text("         0 \nQuestions Answered", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                    ],

                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top:1.0,bottom: 1.0),
                                                  child: VerticalDivider(thickness: 1.0,color: Color(0xff3644BA),),
                                                ),
                                                Container(
                                                  padding:EdgeInsets.all(5.0),
                                                  child: Column(
                                                    children: [


                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Text("          0 \nFriends With", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                                        ],

                                                      ),

                                                      //Text("  Experience",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8),),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top:0.0,bottom: 0.0),
                                                  child: VerticalDivider(thickness: 1.0,color: Color(0xff3644BA),),
                                                ),
                                                Container(
                                                  padding:EdgeInsets.all(5.0),
                                                  child: Column(
                                                    children: [

                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("          0\n Matches Played", style: TextStyle(color: Color(0xffFFFFFF),fontSize: 8,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),

                                                        ],
                                                      ) ],

                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left:7.0,right: 7.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff36A3BA),),
                                ),
                                SizedBox(height: 10,),
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
                                            child: Text("Badges Won",style: TextStyle(fontSize: 12.0,
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
                                Padding(
                                  padding: EdgeInsets.only(left:7.0,right: 7.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          // width: 134,
                                          //height: 10,
                                            padding: EdgeInsets.all(5.0),
                                            child: Text("Achievements",style: TextStyle(fontSize: 12.0,
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
                                Padding(
                                  padding: EdgeInsets.only(left:7.0,right: 7.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          // width: 134,
                                          //height: 10,
                                            padding: EdgeInsets.all(5.0),
                                            child: Text("Favourite Topics",style: TextStyle(fontSize: 12.0,
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
                                Padding(
                                  padding: EdgeInsets.only(left:7.0,right: 7.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10.0),
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Scarlett Threads:", style: TextStyle(color: Color(0xffFFFFFF),
                                              fontSize: 24,fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),

                                        ],
                                      ),
                                      SizedBox(height:5.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start
                                        ,
                                        children: [
                                          Container(
                                              height:134,
                                              //width:308,
                                              child: Image.network(Constant.base_url+"getPdfFile/Group 74",fit: BoxFit.cover,)
                                          ),

                                        ],
                                      ),
                                      SizedBox(height:5.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Lorem Epsum set edum",style: TextStyle(color: Color(0xffFFFFFF),
                                              fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
                                          Icon(Icons.label,color: Color(0xffF2BF4F),)
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.label,color: Color(0xffCCCCCC),size:20),
                                          Icon(Icons.share,color: Color(0xffCCCCCC),size:20) ,
                                          Icon(Icons.comment,color: Color(0xffCCCCCC),size:20)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left:6.0,right: 6.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          // width: 181,
                                          // height: 15,
                                            padding: EdgeInsets.all(5.0),
                                            child: Text("Lorem Epsum set edum ?",style: TextStyle(fontSize: 12.0,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                      ],),
                                    Column(
                                      children: [
                                        Text("38 min ago",style: TextStyle(fontSize: 10.0,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffCCCCCC)),)
                                      ],
                                    )


                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(5.0),
                                        // height:33,
                                        // width: 309,
                                        child: Text("Lorem Ipsum is simply dummy text of the\nprintingand typesetting industry.",
                                          style: TextStyle(fontSize: 12.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),)
                                    ),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.label,color: Color(0xffCCCCCC),size:20),
                                    Icon(Icons.share,color: Color(0xffCCCCCC),size:20) ,
                                    Icon(Icons.comment,color: Color(0xffCCCCCC),size:20)
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:212,
                                      height:21,
                                      // padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Lorem Epsum set edum ?",style: TextStyle(fontSize: 16.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)

                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:260,
                                      height:33,
                                      // padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          //   height:19,
                                          //  width: 211,
                                          Text("Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",style: TextStyle(fontSize: 12.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),)


                                        ],
                                      ),
                                    ),
                                    SizedBox(height:10),
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Lorem Epsum set edum ?",style: TextStyle(fontSize: 16.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)

                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          //   height:19,
                                          //  width: 211,
                                          Text("Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",style: TextStyle(fontSize: 12.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),)


                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left:7.0,right: 7.0),
                                  child: Divider(thickness: 1.0,color: Color(0xff5095E4),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          // width: 181,
                                          // height: 15,
                                            padding: EdgeInsets.all(5.0),
                                            child: Text("Lorem Epsum set edum ?",style: TextStyle(fontSize: 12.0,
                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),)),
                                      ],),
                                    Column(
                                      children: [
                                        Text("38 min ago",style: TextStyle(fontSize: 10.0,
                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffCCCCCC)),)
                                      ],
                                    )


                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      //height:33,
                                      // width: 309,
                                        padding: EdgeInsets.all(5.0),
                                        child: Text("Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",
                                          style: TextStyle(fontSize: 12.0,
                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),)
                                    ),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.label,color: Color(0xffCCCCCC),size:20),
                                    Icon(Icons.share,color: Color(0xffCCCCCC),size:20) ,
                                    Icon(Icons.comment,color: Color(0xffCCCCCC),size:20)
                                  ],
                                ),

                              ],
                            ),


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
