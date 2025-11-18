import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Components/custom_button.dart';
import 'package:pas_mobile_11pplg1_34/Components/text_field.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Pages/home_page.dart';

class LoginPage1 extends StatelessWidget {
  final authController = Get.find<LoginApiController>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: const Color.fromARGB(255, 80, 146, 201),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: usernameController,
              label: "Username",
              icon: Icons.person,
            ),

            const SizedBox(height: 16),

            CustomTextField(
              controller: passwordController,
              label: "Password",
              obscure: true,
              icon: Icons.lock,
            ),

            const SizedBox(height: 20),

            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: CustomButton(
                  text: "Login",
                  isLoading: authController.isLoading.value,
                  onPressed:() {
                  authController.LoginApi();
                },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
