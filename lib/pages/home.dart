import 'package:flutter/material.dart';
import 'detail.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();

  void openDetail(){
    if(namaController.text.isNotEmpty && nimController.text.isNotEmpty){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(
        nama : namaController.text,
        nim : nimController.text
        )
      )
      );
    }
  }
    @override
    Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("NAVIGATOR"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(
              labelText: "Masukkan Nama"
              ),
            ),
            const SizedBox(height: 12,),
            TextField(
              controller: nimController,
              decoration: InputDecoration(
                labelText: "Masukkan NIM"
              ),
            ),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: openDetail, 
            child: const Text("Open Detail"))
          ],
        ),
        ),
    );
  }
}

