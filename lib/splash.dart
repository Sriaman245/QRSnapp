import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_scanner/qrScanner.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), (){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>qrScanner()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 0, 132, 255),
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              Image.asset('assets/images/qr-code.png',height:200,width:200),
              SizedBox(height:20),
              Text("QRSnapp",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),)
            ]
          ),
          ),
      )
    );
  }
}