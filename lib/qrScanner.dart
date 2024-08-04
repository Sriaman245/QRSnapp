import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class qrScanner extends StatefulWidget{
  @override
 State<StatefulWidget> createState()=> qrScannerState();
}

class qrScannerState extends State<qrScanner>{
  GlobalKey qrKey=GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  String qrText="";
  void qrViewCreated(controller){
    setState(() {
      this.controller=controller;
    });
    controller.scannedDataStream.listen((scanData){
      setState(() {
        qrText=scanData.code ?? "";
      });
    });
  }
   void qrLaunch(url) async {
    var myuri=Uri.parse(url);
      await launchUrl(myuri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('QR Code Scanner')),
      ),
      body:Column(
        children: [
         Expanded(
          child:QRView(
            key:qrKey,
            onQRViewCreated:qrViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: const Color.fromARGB(255, 0, 132, 255),
              borderLength: 30.0,
              borderWidth: 11.0,
              borderRadius: 10,  
              cutOutSize: 300,
            )
          ) 
         ),
        SizedBox(height:50),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              if(qrText!="")
               Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:35,left:35),
                    child: Text("Link: $qrText"),
                  ),
                  SizedBox(height:20),
                  ElevatedButton(onPressed: (){
                    qrLaunch(qrText);
                  }, child: Text("Open Link",style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(const Color.fromARGB(255, 0, 140, 255))),
                  )
                ],
               )
               else Text('Scan Code',style:TextStyle(fontSize: 20,)),
              SizedBox(height: 50,) 
            ],
          )
        ],
      ),
    );
  }
 @override
 void dispose(){
  controller?.dispose();
  super.dispose();
 }
}