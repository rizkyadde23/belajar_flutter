import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StateFull Widget",
      debugShowCheckedModeBanner: false,
      home: MahasiswaListPage(),
    );
  }
}

class MahasiswaListPage extends StatefulWidget{
  const MahasiswaListPage({super.key});
  @override
  State<MahasiswaListPage> createState() => _MahasiswaListPageState();
}

class _MahasiswaListPageState extends State<MahasiswaListPage>{
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  List<String> namaMahasiswa = [];
  List<String> nimMahasiswa = [];

  void tambahData(){
    if (namaController.text.isNotEmpty){
      setState(() {
        namaMahasiswa.add(namaController.text,);
        nimMahasiswa.add(nimController.text);
        namaController.clear();
        nimController.clear();
      });
    }
  }

  void deleteData(){    
    setState(() {
      namaMahasiswa.clear();
      nimMahasiswa.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ADD AND DELETE')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: namaController,
            decoration: const InputDecoration(
              labelText: "Masukkan Nama"
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: nimController,
            decoration: InputDecoration(
              labelText: "Masukkan NIM"
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: tambahData,
                child: const Text("Tambah Data")
              ),
              ElevatedButton(
                onPressed: deleteData, 
                child: const Text("Hapus Data")
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text("Daftar Mahasiswa :",
          style: TextStyle(
            fontSize: 16
          ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child:ListView.builder(
                  itemCount: namaMahasiswa.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text('${namaMahasiswa[index]} (${nimMahasiswa[index]})'),
                    );
                  }
                  ),
            )
          ]
          )
        ,
      ),    
    );
}
}