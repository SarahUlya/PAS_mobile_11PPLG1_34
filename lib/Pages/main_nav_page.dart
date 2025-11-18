import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Pages/favorite_page.dart';
import 'package:pas_mobile_11pplg1_34/Pages/home_page.dart';
import 'package:pas_mobile_11pplg1_34/Pages/profile_page.dart';
import 'package:pas_mobile_11pplg1_34/Pages/store_page.dart';

class MainNavPage extends StatefulWidget {
  MainNavPage({super.key});


  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  final auth = Get.find<LoginApiController>();

  int currentIndex = 0;

  final pages = [HomePage(), StorePage(), FavoritePage(), ProfilePage1()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),

          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
