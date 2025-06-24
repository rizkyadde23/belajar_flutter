import 'package:flutter/material.dart';
import 'mahasiswalist.dart';

class Mahasiswa {
  final String nama;
  final String nim;
  Mahasiswa({required this.nama,required this.nim});  
}

class HomePage extends StatelessWidget{
  HomePage({super.key});
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
              title: Text('NAMA : ${mahasiswa.nama}'),
              subtitle: Text('NIM : ${mahasiswa.nim}'),
            ),
          );
        }
        )
      ),
      );
  }
}