import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier{
  int nilai = 0;
  
  void tambah(){
    nilai++;
    notifyListeners();
  }

  void kurang(){
    nilai--;
    notifyListeners();
  }

  void reset(){
    nilai = 0;
    notifyListeners();
  }
}