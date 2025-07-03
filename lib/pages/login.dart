import 'package:belajar/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatelessWidget{
  LoginPage ({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final box = GetStorage();
  
  void login(){
    final username = usernameController.text;
    final password = passwordController.text;
    if (username == 'admin'&&password=='admin123') {
      box.write('isLoggedin', true);
      Get.snackbar("Berhasil", 'Login Berhasil');
      Get.offAll(HomePage());
    } else {
      usernameController.clear();
      passwordController.clear();
      Get.snackbar("Gagal", 'Username atau Password Salah');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(labelText: "Username"),
          ),
          const SizedBox(height: 12,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            ),
          const SizedBox(height: 12,),
          ElevatedButton(onPressed: login, child: Text("Log In"))
        ],
      ),
      ),
    );    
  }
}