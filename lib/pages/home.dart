import 'package:flutter/material.dart';
import 'dynamic_list.dart';

class BottomNav extends StatefulWidget{
  const BottomNav ({super.key});
  @override
  _BottomNavState createState()=>_BottomNavState();
}

class _BottomNavState extends State<BottomNav>{
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Home"),),
    DynamicMahasiswaList(),
    Center(child: Text("About"),),
  ];

void _onTap(int index){
  setState(() {
    _selectedIndex = index;
  });
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Daftar"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ]),
      );
  }
}
