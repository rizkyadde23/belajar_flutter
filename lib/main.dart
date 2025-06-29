import 'package:flutter/material.dart';
import 'pages/counter.dart';
import 'pages/counterpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_)=>Counter(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StateFull Widget",
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}
