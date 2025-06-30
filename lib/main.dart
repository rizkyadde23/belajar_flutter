import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/stream_provider.dart';

final timeProvider = StreamProvider<int>((ref){
  return Stream.periodic(Duration(seconds: 1),(count) => count);
})
;
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
      home: StreamProviderPage(),
    );
  }
}
