import 'package:belajar/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatefulWidget{
  const LoginPage ({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final box = GetStorage();

    void _submitForm(){

    if (_formKey.currentState!.validate()) {
    final username = usernameController.text;
    final password = passwordController.text;
      if (username == 'admin' && password=='admin123') {
      Get.snackbar("Berhasil", "Login Berhasil");
      box.write('isLoggedin', true);
      Get.offAll(HomePage());
      } else {
        usernameController.clear();
        passwordController.clear();
        Get.snackbar("Gagal", "Invalid Username or Password");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
              validator:(value) => value!.isEmpty ? "Username Tidak Boleh Kosong" : null,
            ),
            const SizedBox(height: 12,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              validator: (value) => value!.isEmpty ? "Password Tidak Boleh Kosong" : null,
              ),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: _submitForm, child: Text("Log In"))
          ],
        ),
      ),
      ),
    );    
  }
}