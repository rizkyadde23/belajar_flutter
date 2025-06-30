import 'package:flutter/material.dart';
import '../main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget{
  const CounterPage ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Provider"),),
      body: Center(
        child: Column(
          children: [
            Text("Angka Sekarang :"),
            Text('$counter'),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).reset(), child: Text("Reset")),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).tambah(), child: Text("Tambah")),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).kurang(), child: Text("Kurang"))
          ],
        ),
      ),
    );
  }  
}