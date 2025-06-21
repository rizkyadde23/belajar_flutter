import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widget',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController  = TextEditingController();

  String nama = '';
  String nim  = '';

  void tampilkan() {
    setState(() {
      nama = namaController.text;
      nim  = nimController.text;
    });
  }

  void reset() {
    setState(() {
      namaController.clear();
      nimController.clear();
      nama = '';
      nim  = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input And Output')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Masukkan Nama Anda',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nimController,
              decoration: const InputDecoration(
                labelText: 'Masukkan NIM Anda',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // --- Tombol ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: tampilkan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ), 
                  child: const Text('Tampilkan')),
                ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // --- Hasil ---
            if (nama.isNotEmpty && nim.isNotEmpty) ...[
              Text('Selamat Datang $nama di Flutter', style: const TextStyle(fontSize: 16)),
              Text('NIM Anda adalah $nim', style: const TextStyle(fontSize: 16)),
            ],
          ],
        ),
      ),
    );
  }
}
