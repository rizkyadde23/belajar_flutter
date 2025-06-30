import 'package:belajar/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureProviderPage extends ConsumerWidget{
  const FutureProviderPage ({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final namaAsync = ref.watch(namaProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Future Provider"),),
      body: Center(
        child: namaAsync.when(
          data: (data)=> Text("Nama : $data"), 
          error: (err, _) => Text("Error"), 
          loading: ()=> CircularProgressIndicator()),
      ),
    );
  }
}
