import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Models/store_model.dart';

class StoreCard extends StatelessWidget {
  final TabelModel store;
  final VoidCallback? onFavorite;
  final favController = Get.find<FavoriteController>();
  final username = Get.find<LoginApiController>().username.value;

  StoreCard({super.key, required this.store, this.onFavorite});

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
            color: Colors.grey[200], // supaya PNG transparan kelihatan
            image: DecorationImage(
              image: NetworkImage(store.image),
              fit: BoxFit.cover,
            ),
          ),
        ),

        title: Text(store.title),
        subtitle: Text("Price: ${store.price}"),
        trailing: Obx(
          () => IconButton(
            onPressed: () async {
              store.isFavorite.toggle();
              final username = Get.find<LoginApiController>().username.value;

              if (store.isFavorite.value) {
                await favController.addFavorite(store, username);
              } else {
                await favController.removeFavorite(store.id, username);
              }
            },
            icon: Icon(
              store.isFavorite.value ? Icons.favorite : Icons.favorite_border,
              color: store.isFavorite.value ? Colors.red : Colors.grey,
            ),
          ),
        ),

        onTap: () => Get.toNamed('/detail', arguments: store),
      ),
    );
  }
}
