import 'package:flutter/material.dart';
import 'dynamic_list.dart';

class TabBarApp extends StatelessWidget{
  const TabBarApp ({super.key});

@override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, 
    child:Scaffold(
      appBar: AppBar(
        title: Text("TabBar"),
        bottom: TabBar(tabs: [
          Tab(text: "Home", icon: Icon(Icons.home)),
          Tab(text: "List", icon: Icon(Icons.list)),
          Tab(text: "About", icon: Icon(Icons.info)),
        ]),
      ),
      body: TabBarView(children: [
        Center(child: Text("ini Home Page"),),
        DynamicMahasiswaList(),
        Center(child: Text("ini About Page"),),
      ]),
    )
    );
}
}