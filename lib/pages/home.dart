import 'package:flutter/material.dart';

class ValidationPage extends StatefulWidget{
  const ValidationPage ({super.key});
  @override
  _ValidationPageState createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();

  void _submitForm(){
    if (formKey.currentState!.validate()) {
      final nama = namaController.text;
      final nim = nimController.text;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data Valid: $nama ($nim)')
      )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form"),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
        children: [
          TextFormField(
            controller: namaController,
            decoration: InputDecoration(labelText: "Masukkan Nama"),
            validator: (value){
              if (value==null || value.isEmpty) {
                return "Nama Tidak Boleh Kosong";
              }
              return null;
            },
            ),
            TextFormField(
              controller: nimController,
              decoration: InputDecoration(labelText: "Masukkan Nim"),
              keyboardType: TextInputType.number,
              validator: (value){
                if(value==null || value.isEmpty){
                  return "NIM Tidak Boleh Kosong";
                }
                if (!RegExp(r'^\d+$').hasMatch(value)) {
                  return "NIM Harus Berupa Angka";
                }
                return null;
              },
            ),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: _submitForm, child: Text("Simpan")),
        ],
      )
      ),
      ),
    );
  }

}