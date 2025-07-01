import 'package:belajar/pages/home.dart';
import 'package:belajar/pages/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(
    GetMaterialApp(
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}