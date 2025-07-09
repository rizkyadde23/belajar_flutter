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

}