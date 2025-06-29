import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class CounterPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<Counter>();
    return Scaffold(
      appBar: AppBar(title: Text("Provider"),),
      body: Center(
        child: Column(
          children: [
            Text("Angka Sekarang : "),
            Text("${counter.nilai}"),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: () => context.read<Counter>().reset(), child: Text("Reset")),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: () => context.read<Counter>().tambah(), child: Text("Tambah")),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: () => context.read<Counter>().kurang(), child: Text("Kurang"))
          ],
        ),
      ),
    );
  }  
}