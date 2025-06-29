import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer"),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text("Menu Navigasi"),),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Kembali ke Home")));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: (){showDialog(
                context: context, 
                builder: (context)=>AlertDialog(
                  title: Text("Konfirmasi Logout"),
                  content: Text("Yakin ingin logout?"),
                  actions: [
                    TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Batal")),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil Logout")));
                    }, child: Text("Logout"))
                  ],
                )
                );
                }
            )
          ],
        ),
      ),
      body: Center(child: Text("Ini HomePage"),),
    );
  }
}