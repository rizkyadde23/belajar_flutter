import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/counterpage.dart';
import 'pages/counter.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref)=>Counter());

void main() {
  runApp(
    ProviderScope(child: MyApp())
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
