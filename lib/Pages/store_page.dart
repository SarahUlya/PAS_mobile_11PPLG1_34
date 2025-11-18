import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Components/store_card.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/store_controller.dart';

class StorePage extends StatelessWidget {
  final store = Get.find<StoreController>();
  final favController = Get.find<FavoriteController>();

  StorePage({super.key}) {
    favController.refreshFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Kucing"),
        backgroundColor: const Color.fromARGB(255, 80, 146, 201),
      ),
      body: Obx(() {
        if (store.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (store.errorMessage.isNotEmpty) {
          return Center(child: Text(store.errorMessage.value));
        }

        return ListView.builder(
          itemCount: store.store.length,
          itemBuilder: (_, index) {
            final produk = store.store[index];
            return StoreCard(store: produk);
          },
        );
      }),
    );
  }
}
