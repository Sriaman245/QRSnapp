import 'package:flutter/material.dart';
import 'package:qr_scanner/splash.dart';
void main() => runApp(QRApp());

class QRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}