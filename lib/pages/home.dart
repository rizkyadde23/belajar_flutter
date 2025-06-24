import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});
  final List<Map<String,String>> daftarMahasiswa = [
    {'nama': 'Rizky', 'nim': '123240150'},
    {'nama': 'Zaka', 'nim': '123240157'},
    {'nama': 'Ardi', 'nim': '123240149'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview Builder"),),
      body: Padding(padding: EdgeInsets.all(16),
      child:
        ListView.builder(
          itemCount: daftarMahasiswa.length,
          itemBuilder: (context, index){
          final mahasiswa = daftarMahasiswa[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('NAMA : ${mahasiswa['nama']}'),
              subtitle: Text('NIM : ${mahasiswa['nim']}'),
            ),
          );
        }
        )
      ),
      );
  }
}