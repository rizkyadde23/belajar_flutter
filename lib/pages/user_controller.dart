
import 'user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserController extends GetxController{
  var users = <User>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    isLoading(true);
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      users.value = data.map((e)=> User.fromJson(e)).toList();
    } else {
      Get.snackbar("Error", 'Gagal Mengambil Data');
    }
    isLoading(false);
  }

  void addUsers(String name, String email) async {
    final url = Uri.parse('https://reqres.in/api/users');
    try {
      final response = await http.post(
        url,
        headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer YOUR_API_KEY', //BUTUH API KEY
        },
        body: jsonEncode({'name': name, 'email': email}), // ENCODE JSON
        );
      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        Get.snackbar("Berhasil", "Data ${data['nama']} Berhasil Ditambahkan");
      } else {
        Get.snackbar("Gagal", "Data Gagal Ditambahkan");
      }
    } catch (e) {
      Get.snackbar("Gagal", e.toString());
    }
}

Future<void> updateUsers(int id,String name, String email) async {
  final url = Uri.parse('https://reqres.in/api/users/$id');
  try {
    final response = await http.put(url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'name': name,'email':email})
    );
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      Get.snackbar("Berhasil", "User berhasil Di Update : ${data['name']}");
    }else{
      Get.snackbar("Gagal", "Gagal Mengedit User");
    }
  } catch (e) {
    Get.snackbar("Error", e.toString());
  }
}

}