import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_34/API/register_api.dart';
import 'package:pas_mobile_11pplg1_34/Models/register_model.dart';
import 'package:pas_mobile_11pplg1_34/Pages/home_page.dart';
import 'package:pas_mobile_11pplg1_34/sharedpref_register.dart';

class RegisterController extends GetxController {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  var isLoading = false.obs;
  var registerModel = Rxn<TabelModel>();

  void RegisterApi() async {
    final username = userController.text.trim();
    final password = passwordController.text.trim();
    final fullname = fullnameController.text.trim();
    final email = emailController.text.trim();

    if (username.isEmpty || password.isEmpty && fullname.isEmpty || email.isEmpty) {
      Get.snackbar("Error", "Harus diisi semua!");
      return;
    }

    try {
      isLoading.value = true;

      var url = Uri.parse("${ClientNetwork.baseUrl}register-user");
      var response = await http.post(
        url,
        body: {
          "username": userController.text,
          "password": passwordController.text,
          "fullname": fullnameController.text,
          "email": emailController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        registerModel.value = TabelModel.fromJson(data);

        if (registerModel.value == null) {
          Get.snackbar("Error", "Data login kosong!");
          return;
        }

        final result = registerModel.value!;

        if (result.status) {
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
    await SharedPrefHelper.clearToken();
    Get.snackbar("Logout", "Berhasil keluar akun");
  }

  @override
  void onClose() {
    userController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
