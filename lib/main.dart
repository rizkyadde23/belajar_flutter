import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/future_provider.dart';

final namaProvider = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return "Kakakakka";
});

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
      home: FutureProviderPage(),
    );
  }
}
