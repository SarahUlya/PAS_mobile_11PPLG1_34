import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_34/API/login_api.dart';
import 'package:pas_mobile_11pplg1_34/Models/login_model.dart';
import 'package:pas_mobile_11pplg1_34/Pages/home_page.dart';
import 'package:pas_mobile_11pplg1_34/sharedpref_register.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginApiController extends GetxController {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var username = ''.obs;
  var isLoggedIn = false.obs;
  var isLoading = false.obs;
  var loginModel = Rxn<TabelModel>();


  Future<void> checkLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();
  final savedUsername = prefs.getString("username");

  // Optional: sedikit delay untuk smooth splash
  await Future.delayed(Duration(milliseconds: 200));

  if (savedUsername != null) {
    username.value = savedUsername;
    isLoggedIn.value = true;
    Get.offAllNamed('/home');
  } else {
    Get.offAllNamed('/login');
  }
}

  void LoginApi() async {
    // final username = userController.text.trim();
    // final password = passwordController.text.trim();

    // if (username.isEmpty || password.isEmpty) {
    //   Get.snackbar("Error", "Username dan password tidak boleh kosong");
    //   return;
    // }

    try {
      isLoading.value = true;

      var url = Uri.parse("${ClientNetwork.baseUrl}login");
      var response = await http.post(
        url,
        body: {
          "username": userController.text,
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        loginModel.value = TabelModel.fromJson(data);

        if (loginModel.value == null) {
          Get.snackbar("Error", "Data login kosong!");
          return;
        }

        final result = loginModel.value!;

        if (result.status) {
          if (result.token == true) {
            await SharedPrefHelper.saveToken(result.token);
            print("Token disimpan: ${result.token}");
          } else {
            print("Token tidak ditemukan di response");
          }

          Get.snackbar("Success", result.message);
          Get.off(() => HomePage());
        } else {
          Get.snackbar("Error", result.message);
        }
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghubungi server (${response.statusCode})",
        );
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    }
    isLoading.value = false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
  await prefs.remove("username");
  username.value = '';
  isLoggedIn.value = false;

  // final favController = Get.find<FavoriteController>();
  // favController.clearFavorites();
  Get.offAllNamed('/login');
  }

  @override
  void onClose() {
    userController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
