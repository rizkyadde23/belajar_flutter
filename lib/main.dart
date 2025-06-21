import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StateFull Widget",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String teks = 'Increment';
  int i = 0;
  void increment() {
    setState(() {
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Increment App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              teks,
              style: TextStyle(fontSize: 28),
            ),
            Text(
              i.toString(),
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: increment,
              child: Text('Tambah Angka'),
            ),
          ],
        ),
      ),
    );
  }
}