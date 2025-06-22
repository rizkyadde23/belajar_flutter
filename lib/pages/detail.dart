import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  final String nama;
  final String nim;
  const DetailPage({
    super.key,
    required this.nama,
    required this.nim
    });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NAMA : $nama',
              style: TextStyle(
                fontSize: 16
              ),
              ),
            const SizedBox(height: 12,),
            Text('NIM : $nim',
              style: TextStyle(
                fontSize: 16
              ),
              ),
            const SizedBox(height: 12,),
            Center(child: ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Back")))
          ],
        ),
        ),
    );
  }
}