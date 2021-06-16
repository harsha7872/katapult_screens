import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:katapult_screens/razorpay_flutter.dart';
import 'MainPage_11.dart';
import 'constants.dart';
import 'screen_66.dart';
class Screen62 extends StatefulWidget {
  String username;
  @override
  _Screen62State createState() => _Screen62State();
  Screen62(this.username);
}

class _Screen62State extends State<Screen62>with TickerProviderStateMixin  {
  bool selected = false;
  var userStatus = List<bool>();
  TabController _controller;
  String url= 'http://3.139.74.186/challenges';


  List data;
  static const platform = const MethodChannel("razorpay_flutter");
  Razorpay _razorpay;


  // ignore: missing_return
  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url));

    this.setState(() {
      Map<String, dynamic> extractdata = jsonDecode(response.body);
      data = extractdata["recordset"];
    });
  }
  @override

  // ignore: must_call_super
  void initState(){
    this.makeRequest();
    _controller = new TabController(length: 3, vsync: this);
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    super.dispose();
    _razorpay.clear();
  }
  void openCheckout() async {
    var options = {
      'key': 'rzp_test_zMWcCd4Rlyvv8d',
      'amount':'200000',
      'name': 'Pragmatiq',
      'description': 'Payment for Katapult',
      'prefill': {'contact': '8888888888', 'email': 'pragmatiq@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(

        //backgroundColor: Color(0xff000877).withOpacity(0.80)  ,
          body: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height,
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(Constant.base_url+"getPdfFile/bcImg"),
                      fit: BoxFit.cover)),

              //padding: EdgeInsets.all(8.0),
              child:Container(
                color: Color(0xff91236C).withOpacity(0.80),
                padding: EdgeInsets.all(8.0),
                child: Column(
                      children: [

                       SizedBox(height:30.0,),

                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Row(
                            children:[
                              Flexible(
                                child: Card(
                                  color: Color(0xff91236C) ,
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
                                                  Icons.arrow_back, color: Colors.white,)
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
                          flex:11,
                          fit:FlexFit.tight,
                          child: Container(
                           // height: 689,
                            //width: 341,
                            child: Card(
                              color: Color(0xffBA5D9A).withOpacity(0.40),
                              //margin: EdgeInsets.only(top: 30.0,bottom: 150.0,right: 25.0,left: 25.0),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0)
                              ),
                              child: Container(
                                padding:EdgeInsets.all(2.0),
                                child: Center(

                                  child: Column(
                                    children: [
                                      SizedBox(height: 5,),
                                      Text("Marketplace",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 24,
                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                      SizedBox(height: 20,),
                                      Container(
                                        //decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
                                        // height:126 ,
                                        // width: 259,
                                        child: new TabBar(

                                          controller: _controller,
                                          indicatorColor: Color(0xff5095E4),
                                          tabs: [
                                            Container(
                                              width: 100,
                                              height: 53,
                                              child: Tab(

                                                child: Container(

                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Color(0xff16C5BE),
                                                  ),
                                                  child: Align(
                                                    //  alignment: Alignment.center,
                                                      child:Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Stack(

                                                              alignment: Alignment.center,
                                                              children: <Widget>[
                                                                Container(
                                                                  height:29,
                                                                  width:29,
                                                                  child:  Image.network(Constant.base_url+"getPdfFile/abd"),

                                                                ),

                                                                Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text("K",style: TextStyle(color:Color(0xff16C5BE),
                                                                    fontSize: 18,fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                                                ),
                                                              ]

                                                          ),
                                                          Text("coins",style: TextStyle(fontSize: 8,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 53,
                                              child: Tab(

                                                child: Container(
                                                  //height: 53,
                                                  // width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Color(0xff5555FF),
                                                  ),
                                                  child: Align(
                                                      alignment: Alignment.center,
                                                      child:Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                        children: [
                                                          Image.network(Constant.base_url+"getPdfFile/Life Line"),
                                                          Text("Powerups & Lifelines",style: TextStyle(fontSize: 6,
                                                            color:Color(0xffFFFFFF),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                        ],
                                                      )
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 53,
                                              //margin: EdgeInsets.all(5.0),

                                              child: Tab(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Color(0xff5095E4),
                                                  ),
                                                  child: Align(

                                                      alignment: Alignment.center,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Image.network(Constant.base_url+"getPdfFile/Experience Boosters"),
                                                          Text("Experience Boosters",style: TextStyle(fontSize: 6,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                        ],
                                                      )
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),







                                      ),
                                      new Container(
                                        padding: EdgeInsets.all(10.0),
                                        height: 520.0,
                                        child: new TabBarView(
                                          controller: _controller,
                                          children: <Widget>[
                                            new Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,

                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Recommended ",style: TextStyle(fontSize: 14,color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child:Stack(

                                                            alignment: Alignment.center,
                                                            children: <Widget>[
                                                              Image.network(Constant.base_url+"getPdfFile/abd",height:29,width:29,color: Color(0xff16C5BE),),
                                                              Padding(
                                                                padding: const EdgeInsets.all(7.0),
                                                                child: Text("K",style:TextStyle(fontSize:20,color:Color(0xffFFFFFF),
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w700,)),
                                                              ),
                                                            ]
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        crossAxisAlignment:CrossAxisAlignment.start,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {},
                                                            child: GestureDetector(
                                                              onTap: (){
                                                                openCheckout();
                                                              },
                                                              child: Text("3000 ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                            ),
                                                          ),
                                                          Text("Ante Coins",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 130,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                  color: Color(0xffFFFFFF),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 25,),
                                                  Row(
                                                    children: [
                                                      Text("Best Deals ",style: TextStyle(fontSize: 14,color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child:Stack(

                                                            alignment: Alignment.center,
                                                            children: <Widget>[
                                                              Image.network(Constant.base_url+"getPdfFile/abd",color: Color(0xff16C5BE),),
                                                              Text("K",style:TextStyle(fontSize:20,color:Color(0xffFFFFFF),
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700,)),
                                                            ]
                                                        ),
                                                      ),
                                                      SizedBox(width:10),
                                                      Column(
                                                        children: [
                                                          Text("10000 ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Ante Coins",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 130,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,color: Color(0xffFFFFFF),
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child:Stack(

                                                            alignment: Alignment.center,
                                                            children: <Widget>[
                                                              Image.network(Constant.base_url+"getPdfFile/abd",color: Color(0xff16C5BE),),
                                                              Text("K",style:TextStyle(fontSize:20,color:Color(0xffFFFFFF),
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700,)),
                                                            ]
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children: [
                                                          Text("20000 ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Ante Coins",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 125,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,color: Color(0xffFFFFFF)
                                                                  ,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 35,),
                                                  Row(
                                                    children: [
                                                      Text("Other Deals ",style: TextStyle(fontSize: 14,color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child:Stack(

                                                            alignment: Alignment.center,
                                                            children: <Widget>[
                                                              Image.network(Constant.base_url+"getPdfFile/abd",color: Color(0xff16C5BE),),
                                                              Text("K",style:TextStyle(fontSize:20,color:Color(0xffFFFFFF),
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700,)),
                                                            ]
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        crossAxisAlignment:CrossAxisAlignment.start,
                                                        children: [
                                                          Text("100 ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Ante Coins",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 130,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,color: Color(0xffFFFFFF),
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child:Stack(

                                                            alignment: Alignment.center,
                                                            children: <Widget>[
                                                              Image.network(Constant.base_url+"getPdfFile/abd",color: Color(0xff16C5BE),),
                                                              Text("K",style:TextStyle(fontSize:20,color:Color(0xffFFFFFF),
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700,)),
                                                            ]
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        crossAxisAlignment:CrossAxisAlignment.start,
                                                        children: [
                                                          Text("250 ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Ante Coins",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 130,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,color: Color(0xffFFFFFF),
                                                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child:Stack(

                                                            alignment: Alignment.center,
                                                            children: <Widget>[
                                                              Image.network(Constant.base_url+"getPdfFile/abd",color: Color(0xff16C5BE),),
                                                              Text("K",style:TextStyle(fontSize:20,color:Color(0xffFFFFFF),
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700,)),
                                                            ]
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        crossAxisAlignment:CrossAxisAlignment.start,
                                                        children: [
                                                          Text("500 ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Ante Coins",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 130,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                  color: Color(0xffFFFFFF),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child:Stack(

                                                            alignment: Alignment.center,
                                                            children: <Widget>[
                                                              Image.network(Constant.base_url+"getPdfFile/abd",color: Color(0xff16C5BE),),
                                                              Text("K",style:TextStyle(color:Color(0xffFFFFFF),fontSize:20,
                                                                fontFamily: 'Montserrat',fontWeight: FontWeight.w700,)),
                                                            ]
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        crossAxisAlignment:CrossAxisAlignment.start,
                                                        children: [
                                                          Text("1000 ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Ante Coins",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 130,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                  color: Color(0xffFFFFFF),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            new Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,

                                                children: [
                                                  //Recommended text
                                                  Row(
                                                    children: [
                                                      Text("Recommended ",style: TextStyle(fontSize: 14,color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  //text bundled pack
                                                  Row(
                                                    children: [

                                                      Column(
                                                        children: [
                                                          Text("Bundled Pack of ",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                        ],
                                                      ),
                                                      SizedBox(width: 80,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            padding: EdgeInsets.all(1.0),
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.network(Constant.base_url+"getPdfFile/eclipse"),
                                                                          Text("K",style: TextStyle(color:Color(0xffF2BF4F),fontSize: 9,
                                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),
                                                                          ),]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 62,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff16C5BE),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height:3),
                                                  //button
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 200,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [

                                                                    Container(
                                                                      height: 20,
                                                                      width: 18,
                                                                      child: Image.asset("assets/Correct Answer.png"),

                                                                    ),
                                                                    Text("x(25) +",style: TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),),
                                                                    Container(
                                                                      height: 15,
                                                                      width: 34,
                                                                      child: Image.asset("assets/50 50.png"),),
                                                                    Text("x(25) +",style: TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),),
                                                                    Container(
                                                                      height: 16,
                                                                      width: 17,
                                                                      child:Image.asset("assets/3x.png"),),
                                                                    Text("x(25) ",style: TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),),
                                                                  ],
                                                                ),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                    ],
                                                  ),
                                                  SizedBox(height: 25,),
                                                  //Best Deals text
                                                  Row(
                                                    children: [
                                                      Text("Best Deals ",style: TextStyle(fontSize: 14,color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),
                                                  //text bundled pack & buttons
                                                  Row(
                                                    children: [

                                                      Column(
                                                        children: [
                                                          Text("Bundled Pack of ",style: TextStyle(fontSize: 12,
                                                            color:Color(0xffFFFFFF),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                        ],
                                                      ),
                                                      SizedBox(width: 80,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xffF2BF4F),fontSize: 9,
                                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 62,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff16C5BE),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  //button
                                                  SizedBox(height:3),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 200,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [

                                                                    Container(
                                                                      height: 20,
                                                                      width: 18,
                                                                      child: Image.asset("assets/Correct Answer.png"),

                                                                    ),
                                                                    Text("x(25) +",style: TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),),
                                                                    Container(
                                                                      height: 15,
                                                                      width: 34,
                                                                      child: Image.asset("assets/50 50.png"),),
                                                                    Text("x(25) +",style: TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),),
                                                                    Container(
                                                                      height: 16,
                                                                      width: 17,
                                                                      child:Image.asset("assets/3x.png"),),
                                                                    Text("x(25) ",style: TextStyle(fontSize: 9,fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),),
                                                                  ],
                                                                ),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                    ],
                                                  ),

                                                  SizedBox(height: 35,),
                                                  //Other Deals text
                                                  Row(
                                                    children: [
                                                      Text("Other Deals ",style: TextStyle(fontSize: 14,color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  //buttons 1
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 75,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [

                                                                    Container(
                                                                      height: 20,
                                                                      width: 18,
                                                                      child: Image.asset("assets/Correct Answer.png"),

                                                                    ),
                                                                    Text("x(5)",style:TextStyle(fontSize: 9,color:Color(0xffFFFFFF),
                                                                      fontFamily: 'Montserrat',fontWeight: FontWeight.w600,))

                                                                  ],
                                                                ),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 110,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xffF2BF4F),fontSize: 9,
                                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w700,),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 62,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff16C5BE),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  //buttons 2
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 75,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [

                                                                    Container(
                                                                      height: 20,
                                                                      width: 18,
                                                                      child: Image.asset("assets/50 50.png"),

                                                                    ),
                                                                    Text("x(5)",style:TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)))
                                                                  ],
                                                                ),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                      SizedBox(width: 110,),

                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xffF2BF4F),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 62,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff16C5BE),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  //button 3
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 75,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [

                                                                    Container(
                                                                      height: 20,
                                                                      width: 18,
                                                                      child: Image.asset("assets/3x.png"),

                                                                    ),
                                                                    Text("x(5)",style:TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)))
                                                                  ],
                                                                ),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 110,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xffF2BF4F),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 62,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff16C5BE),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  //button 4
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 75,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [

                                                                    Container(
                                                                      height: 20,
                                                                      width: 18,
                                                                      child: Image.asset("assets/Correct Answer.png"),

                                                                    ),
                                                                    Text("x(25)",style: TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),)

                                                                  ],
                                                                ),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                      SizedBox(width: 110,),

                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xffF2BF4F),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 62,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff16C5BE),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  //button 5
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 75,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [

                                                                    Container(
                                                                      height: 20,
                                                                      width: 18,
                                                                      child: Image.asset("assets/50 50.png"),

                                                                    ),
                                                                    Text("x(25)",style: TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),)
                                                                  ],
                                                                ),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                      SizedBox(width: 110,),

                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xffF2BF4F),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 62,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff16C5BE),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  //button 6
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 75,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff2680EB),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [

                                                                    Container(
                                                                      height: 20,
                                                                      width: 18,
                                                                      child: Image.asset("assets/50 50.png"),

                                                                    ),
                                                                    Text("x(25)",style: TextStyle(fontSize: 9,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),)
                                                                  ],
                                                                ),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                      SizedBox(width: 110,),

                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xffF2BF4F),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 10,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 62,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xff16C5BE),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),
                                            new Container(

                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,

                                                children: [
                                                  //recomended text
                                                  Row(
                                                    children: [
                                                      Text("Recommended ",style: TextStyle(fontSize: 14,color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  //text & buttons
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:29,
                                                        width:29,
                                                        alignment: Alignment.centerLeft,
                                                        child: Image.asset('assets/Experience Boosters.png'),

                                                      ),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("30 Days ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Experience Boosters",style: TextStyle(fontSize: 12,
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF),),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            padding: EdgeInsets.all(1.0),
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffDE79BF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xff8F236D),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,
                                                                    color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 25,),
                                                  //best deals text
                                                  Row(
                                                    children: [
                                                      Text("Best Deals ",style: TextStyle(fontSize: 14,color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  //row 1
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:29,
                                                        width:29,
                                                        alignment: Alignment.centerLeft,
                                                        child: Image.asset('assets/Experience Boosters.png'),

                                                      ),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("60 Days ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Experience Boosters",style: TextStyle(fontSize: 12,
                                                            color:Color(0xffFFFFFF),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            padding: EdgeInsets.all(1.0),
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffDE79BF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xff8F236D),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  // Row 2
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:29,
                                                        width:29,
                                                        alignment: Alignment.centerLeft,
                                                        child: Image.asset('assets/Experience Boosters.png'),

                                                      ),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("100 Days ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Experience Boosters",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            padding: EdgeInsets.all(1.0),
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffDE79BF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xff8F236D),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 35,),
                                                  //other deals text
                                                  Row(
                                                    children: [
                                                      Text("Other Deals ",style: TextStyle(fontSize: 14,color:Color(0xffFFFFFF),
                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:29,
                                                        width:29,
                                                        alignment: Alignment.centerLeft,
                                                        child: Image.asset('assets/Experience Boosters.png'),

                                                      ),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("1 Days ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Experience Boosters",style: TextStyle(fontSize: 12,
                                                            color:Color(0xffFFFFFF),fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            padding: EdgeInsets.all(1.0),
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffDE79BF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xff8F236D),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:29,
                                                        width:29,
                                                        alignment: Alignment.centerLeft,
                                                        child: Image.asset('assets/Experience Boosters.png'),

                                                      ),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("2 Days ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Experience Boosters",style: TextStyle(fontSize: 12,
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF),
                                                          ),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            padding: EdgeInsets.all(1.0),
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffDE79BF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xff8F236D),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:29,
                                                        width:29,
                                                        alignment: Alignment.centerLeft,
                                                        child: Image.asset('assets/Experience Boosters.png'),

                                                      ),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("5 Days ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Experience Boosters",style: TextStyle(fontSize: 12,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            padding: EdgeInsets.all(1.0),
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffDE79BF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xff8F236D),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height:29,
                                                        width:29,
                                                        alignment: Alignment.centerLeft,
                                                        child: Image.asset('assets/Experience Boosters.png'),

                                                      ),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("15 Days ",style: TextStyle(fontSize: 20,color:Color(0xffFFFFFF),
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,),),
                                                          Text("Experience Boosters",style: TextStyle(fontSize: 12,
                                                            fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color:Color(0xffFFFFFF),),)
                                                        ],
                                                      ),
                                                      SizedBox(width: 20,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            padding: EdgeInsets.all(1.0),
                                                            width: 51,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffDE79BF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child:
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                        alignment: Alignment.center,
                                                                        children: <Widget>[
                                                                          Image.asset('assets/eclipse.png'),
                                                                          Text("K",style: TextStyle(color:Color(0xff8F236D),
                                                                              fontFamily: 'Montserrat',fontWeight: FontWeight.w700,fontSize: 9),),
                                                                        ]
                                                                    ),
                                                                    Text("0.00",style: TextStyle(fontSize: 8.0,
                                                                        fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),

                                                                  ],),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),
                                                      SizedBox(width: 5,),
                                                      Column(
                                                        children: [
                                                          //Icon(Icons.),
                                                          Container(
                                                            width: 71,
                                                            height: 23,
                                                            child:RaisedButton(
                                                                padding: EdgeInsets.zero,
                                                                color: Color(0xffF2BF4F),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: new BorderRadius.circular(100.0)
                                                                ),
                                                                child: Text("₹ 0.00",style: TextStyle(fontSize: 8.0,
                                                                    fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                                                onPressed: (){}
                                                            ),
                                                          ),

                                                        ],),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),

                            ),

                          ),
                        ),

                      ]
                  ),

              ),
            ),


          )

      ),
    );
  }
  void moveToLastScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Screen1(),
    ));
  }
}
