import 'package:flutter/material.dart';
import 'home.dart';

class DetailPage extends StatelessWidget {
  final Mahasiswa mahasiswa;
  const DetailPage ({super.key,required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title : Text("Detail"),),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama : ${mahasiswa.nama} (${mahasiswa.nim})'),
          SizedBox(height: 12,),
          ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text("Kembali"))
        ],
      ),
      ),
  ) ;   
  }
}