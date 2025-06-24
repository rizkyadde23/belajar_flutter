import 'package:belajar/pages/detail.dart';
import 'package:flutter/material.dart';

class Mahasiswa {
  final String nama;
  final String nim;
  Mahasiswa({required this.nama,required this.nim});  
}

class DynamicMahasiswaList extends StatefulWidget{
  const DynamicMahasiswaList({super.key});

  @override
  State<DynamicMahasiswaList> createState() => _DynamicMahasiswaListState();
}

class _DynamicMahasiswaListState extends State<DynamicMahasiswaList>{
  List<Mahasiswa> daftarMahasiswa = [];
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();

  void tambahData(){
  if (namaController.text.isNotEmpty && nimController.text.isNotEmpty) {
    setState(() {
      daftarMahasiswa.add(Mahasiswa(nama: namaController.text, nim: nimController.text));
    });
    namaController.clear();
    nimController.clear();
  }    
  }

  void hapusData(int index){
    setState(() {
      daftarMahasiswa.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview Builder"),),
      body: Padding(padding: EdgeInsets.all(16),
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
                labelText: "Masukkan Nim"
              ),
            ),
            const SizedBox(height: 12,),
            ElevatedButton(
                onPressed: tambahData,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent), 
                child: Text("Tambah") 
                ),
            Expanded(
              child: ListView.builder(
                itemCount: daftarMahasiswa.length,
                itemBuilder: (context, index){
                final mahasiswa = daftarMahasiswa[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('NAMA : ${mahasiswa.nama}'),
                    subtitle: Text('NIM : ${mahasiswa.nim}'),
                    trailing: IconButton(onPressed: () => hapusData(index), icon: Icon(Icons.delete)),
                    onTap: ()=>Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> DetailPage(mahasiswa: daftarMahasiswa[index])
                )
                ), 
                ),
                );
              }
              ),
            ),

        ],
      )
      ),
      );
  }
}