import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Models/store_model.dart';

class StoreCard extends StatelessWidget {
  final TabelModel store;
  final FavoriteController favController = Get.find<FavoriteController>();

  StoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: ClipOval(
            child: Image.network(
              store.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.broken_image, size: 40),
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2));
              },
            ),
          ),
        ),
        title: Text(store.title),
        subtitle: Text("Price: ${store.price}"),
        trailing: Obx(() {
          final username = Get.find<LoginApiController>().username.value;
          return IconButton(
            icon: Icon(
              store.isFavorite.value
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: store.isFavorite.value ? Colors.red : Colors.grey,
            ),
            onPressed: () async {
              if (store.isFavorite.value) {
                await favController.removeFavorite(store.id, username);
                Get.snackbar(
                  "Removed",
                  "${store.title} dihapus dari favorite",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2),
                  margin: const EdgeInsets.all(12),
                );
              } else {
                await favController.addFavorite(store, username);
                Get.snackbar(
                  "Added",
                  "${store.title} ditambahkan ke favorite",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2),
                  margin: const EdgeInsets.all(12),
                );
              }

              store.isFavorite.value = !store.isFavorite.value;
            },
          );
        }),
        onTap: () => Get.toNamed('/detail', arguments: store),
      ),
    );
  }
}
