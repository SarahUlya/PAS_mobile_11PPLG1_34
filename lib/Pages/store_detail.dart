import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Models/store_model.dart';

class StoreDetail extends StatelessWidget {
  const StoreDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final TabelModel cat = Get.arguments;
    final fav = Get.find<FavoriteController>();
    final username = Get.find<LoginApiController>().username.value;
    fav.isFavorite(cat.id, username);

    return Scaffold(
      appBar: AppBar(title: Text(cat.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  cat.image,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Icon(Icons.broken_image, size: 120),
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Nama: ${cat.title}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),
            Text(
              "Price: ${cat.price}",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),

            SizedBox(height: 10),
            Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(cat.description, style: TextStyle(fontSize: 16)),

            SizedBox(height: 20),

            FutureBuilder<bool>(
              future: fav.isFavorite(cat.id, username),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                final isFav = snapshot.data!;
                return ElevatedButton(
                  onPressed: () async {
                    if (isFav) {
                      await fav.removeFavorite(cat.id, username);
                    } else {
                      await fav.addFavorite(cat, username);
                    }
                    fav.refreshFavorites(); // update list
                  },
                  child: Text(isFav ? "Hapus Favorite" : "Tambah Favorite"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
