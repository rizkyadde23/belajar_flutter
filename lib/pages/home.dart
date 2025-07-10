import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class HomePage extends StatelessWidget {
  HomePage ({super.key});
  final controller = Get.put(UserController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                      onTap: () {
                          Get.defaultDialog(
                          title: "Edit User",
                          content: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(labelText: "Nama"),
                                  validator: (value) => value!.isEmpty ? "Nama wajib diisi" : null,
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(labelText: "Email"),
                                  validator: (value) => value!.isEmpty ? "Email wajib diisi" : null,
                                ),
                              ],
                            ),
                          ),
                          textConfirm: "Update",
                          textCancel: "Batal",
                          confirmTextColor: Colors.white,
                          onConfirm: () {
                            if (formKey.currentState!.validate()) {
                              final name = nameController.text.trim();
                              final email = emailController.text.trim();
                              final id = user.id;
                              Get.find<UserController>().updateUsers(id, name, email);
                              Get.back(); // Tutup dialog
                            }
                          },
                          onCancel: Get.back,
                        );
                      },
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
