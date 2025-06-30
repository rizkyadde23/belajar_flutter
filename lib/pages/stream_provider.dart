import 'package:belajar/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamProviderPage extends ConsumerWidget{
  const StreamProviderPage ({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waktu = ref.watch(timeProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Stream Provider"),),
      body: Center(
        child: waktu.when(
          data: (data)=> Text("Waktu : $data s"), 
          error: (err, _) => Text("Error : $err"), 
          loading: ()=> CircularProgressIndicator()),
      ),
    );
  }
}
