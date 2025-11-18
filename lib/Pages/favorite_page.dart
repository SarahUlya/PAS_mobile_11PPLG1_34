import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Models/store_model.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final fav = Get.find<FavoriteController>();
  final username = Get.find<LoginApiController>().username.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Cats"),
        backgroundColor: const Color.fromARGB(255, 80, 146, 201),
      ),

      body: Obx(() {
        if (fav.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (fav.favorites.isEmpty) {
          return const Center(
            child: Text("Belum ada favorite", style: TextStyle(fontSize: 18)),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: fav.favorites.length,
          itemBuilder: (context, index) {
            TabelModel store = fav.favorites[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    store.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 40),
                  ),
                ),
                title: Text(store.title),
                subtitle: Text(store.price.toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    final username = Get.find<LoginApiController>().username.value;
                    await fav.removeFavorite(store.id, username);
                    Get.snackbar(
                      "Removed",
                      "${store.title} dihapus dari favorite",
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                ),

                onTap: () {
                  Get.toNamed("/detail", arguments: store);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
