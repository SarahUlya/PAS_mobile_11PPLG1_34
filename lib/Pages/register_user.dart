import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Components/custom_button.dart';
import 'package:pas_mobile_11pplg1_34/Components/text_field.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/register_controller.dart';

class RegisterUser extends StatelessWidget {
  RegisterUser({super.key});
  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Page"), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container(
          margin: const EdgeInsets.only(top: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: controller.userController,
                    label: "Username",
                    icon: Icons.person,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: controller.passwordController,
                    label: "Password",
                    obscure: true,
                    icon: Icons.lock,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: controller.fullnameController,
                    label: "Full Name",
                    obscure: true,
                    icon: Icons.person,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: controller.emailController,
                    label: "Email",
                    obscure: true,
                    icon: Icons.email,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: "Register",
                    onPressed: () {
                      if (!controller.isLoading.value) {
                        controller.RegisterApi();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }
}
