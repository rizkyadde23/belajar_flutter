import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int>{
  Counter() : super(0);
  void tambah() => state++;
  void kurang() => state--;
  void reset() => state = 0;
}