import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Components/custom_button.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';

class ProfilePage1 extends StatelessWidget {
  ProfilePage1({super.key});

  final auth = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 80, bottom: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5092C9),
                  Color(0xFF78B4DC),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 70, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                Obx(
                  () => Text(
                    auth.username.value.isEmpty
                        ? "Loading..."
                        : auth.username.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  children: [
                    Icon(Icons.person_outline, size: 40, color: Colors.blue.shade700),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Obx(
                        () => Text(
                          "Username: ${auth.username.value}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: CustomButton(
              text: 'Logout',
              isLoading: false,
              color: Colors.red,
              onPressed: () => auth.logout(),
            ),
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
