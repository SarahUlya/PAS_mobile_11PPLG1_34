import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';

class HomePage extends StatelessWidget {
  final auth = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 146, 201),
        title: const Text('Home'),
      ),
      body: Center(
        child: Obx(() {
          return Text(
            auth.username.value.isNotEmpty
                ? "Hello, ${auth.username.value} 👋😆"
                : "Loading...",
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          );
        }),
      ),
    );
  }
}
