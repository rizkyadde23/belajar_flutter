import 'package:belajar/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );    
  }
}

