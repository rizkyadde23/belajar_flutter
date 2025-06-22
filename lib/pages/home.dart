import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragePage extends StatefulWidget{
  const LocalStoragePage({super.key});

  @override
  State<LocalStoragePage> createState() => _LocalStoragePageState();
}

class _LocalStoragePageState extends State<LocalStoragePage>{
final TextEditingController namaController = TextEditingController();
final TextEditingController nimController = TextEditingController();

String? savedNama;
String? savedNim;

@override
void initState(){
  super.initState();
  loadData();
}

Future<void> loadData() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    savedNama = prefs.getString('nama');
    savedNim = prefs.getString('nim');
  });
}

Future<void> simpanData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('nama', namaController.text);
  await prefs.setString('nim', nimController.text);
  loadData();
}

Future<void> hapusData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('nama');
  await prefs.remove('nim');
  setState(() {
    savedNama = null;
    savedNim = null;
  });
}

@override
void dispose() {
  namaController.dispose();
  nimController.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text("Shared Preference"),
    ),
    body: Padding(padding: EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
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
      Row(
        children: [
          ElevatedButton(onPressed: simpanData,
           style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
           child: Text("Simpan")),
          ElevatedButton(onPressed: hapusData, 
          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
          child:Text("Hapus"),
          )
        ],
      ),
      const SizedBox(height: 12,),
      Text("Data Tersimpan", style: TextStyle(fontSize:16),),
      const SizedBox(height: 12,),
      Text('Nama : ${savedNama ?? "-"}'),
      Text('NIM : ${savedNim ?? "-"}'),
    ],
    ),
    ),
  );
}

}