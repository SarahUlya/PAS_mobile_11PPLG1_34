import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/home_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/register_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/store_controller.dart';
import 'package:pas_mobile_11pplg1_34/Routes/pages.dart';
import 'package:pas_mobile_11pplg1_34/Routes/routes.dart';

void main() {
  Get.put(RegisterController());  
  Get.put(LoginApiController()); 
  Get.put(HomeController()); 
  Get.put(FavoriteController()); 
  Get.put(StoreController()); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppRoutes.home ,
      getPages: AppPages.pages,
    );
  }
}

