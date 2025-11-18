import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Components/custom_button.dart';
import 'package:pas_mobile_11pplg1_34/Components/text_field.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/register_controller.dart';

class LoginPage1 extends StatelessWidget {
  final authController = Get.find<LoginApiController>();
  final auth = Get.find<RegisterController>();

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
                  onPressed: () {
                    authController.userController.text =
                        usernameController.text;
                    authController.passwordController.text =
                        passwordController.text;
                    authController.LoginApi();
                  },
                ),
              ),
            ),

            SizedBox(height: 80),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Belum punya akun? Register dulu ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(height: 50),

            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: CustomButton(
                  text: "Register",
                  isLoading: false, 
                  onPressed: () {
                    Get.toNamed(
                      '/register',
                    ); 
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
