import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FutureBuilderPage extends StatelessWidget{

final String? nama;
final String? nim;

  const FutureBuilderPage({
    super.key,
    required this.nama,
    required this.nim,
    });

  Future<Map<String,String>> ambilData() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    return {
    'nama' : prefs.getString('nama') ?? 'Belum Ada Nama',
    'nim' : prefs.getString('nim') ?? 'Belum Ada NIM',
    };

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( title: Text("Future Builder"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
                  children: [
                    FutureBuilder(
                    future: ambilData(), 
                    builder: (context, snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if(snapshot.hasError){
                        return Text('Terjadi Error : ${snapshot.error}');
                      } else if(snapshot.hasData){
                        final data = snapshot.data!;
                        return 
                            Text('${data['nama']} (${data['nim']})', style: TextStyle(fontSize: 16),);
                      }else{
                        return Text('Tidak Ada Data');
                      }  
                      }
                    ),
                    const SizedBox(height: 12,),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("BACK"))
                  ],
                ),
          ),
      ),
      );
  }
}