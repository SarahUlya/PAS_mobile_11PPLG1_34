import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  // pakai obs, default kosong
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }
  loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? '';
  }

  removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    username.value = '';
  }
}
