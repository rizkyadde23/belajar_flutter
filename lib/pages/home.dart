import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class HomePage extends StatelessWidget {
  HomePage ({super.key});
  final controller = Get.put(UserController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(height: 12,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: (){
              final name = nameController.text.trim();
              final job = emailController.text.trim();
              if(name.isNotEmpty && job.isNotEmpty){
                controller.addUsers(name, job);
                nameController.clear();
                emailController.clear();
              } else {
                Get.snackbar("Validasi", "Semua field harus diisi");
              }
            }, child: Text("Simpan")),
            const SizedBox(height: 12,),
            Expanded(
              child: Obx(
                () {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final user = controller.users[index];
                    return ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
