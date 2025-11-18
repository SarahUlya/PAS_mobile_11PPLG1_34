import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Models/store_model.dart';

class FavoriteButton extends StatelessWidget {
  final TabelModel cat;
  const FavoriteButton({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    final fav = Get.find<FavoriteController>();

    return Obx(() {
  final isFav = cat.isFavorite.value;
  final username = Get.find<LoginApiController>().username.value;

  return ElevatedButton(
    onPressed: () async {
      if (isFav) {
        await fav.removeFavorite(cat.id, username);
        cat.isFavorite.value = false;
        Get.snackbar("Favorite", "${cat.title} dihapus!");
      } else {
        await fav.addFavorite(cat, username);
        cat.isFavorite.value = true;
        Get.snackbar("Favorite", "${cat.title} ditambahkan!");
      }
    },
    child: Text(isFav ? "Hapus Favorite" : "Tambah Favorite"),
  );
});

  }
}
