import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/store_controller.dart';
import 'package:pas_mobile_11pplg1_34/Databases/db_helper.dart';
import 'package:pas_mobile_11pplg1_34/Models/store_model.dart';


class FavoriteController extends GetxController {
  var favorites = <TabelModel>[].obs;
  var isLoading = false.obs;

  final db = DbHelper();

  @override
  void onInit() {
    super.onInit();
    final username = Get.find<LoginApiController>().username.value;
    if (username.isNotEmpty) loadFavorites(username);
  }

  Future<void> loadFavorites(String username) async {
    isLoading.value = true;
    favorites.value = await db.getFavoritesByUser(username);
    isLoading.value = false;
  }

  Future<void> addFavorite(TabelModel store, String username) async {
    await db.insertFavorite(store, username);

    final storeControl = Get.find<StoreController>();
    final index = storeControl.store.indexWhere((c) => c.id == store.id);
    if (index != -1) {
      storeControl.store[index].isFavorite.value = true;
    }

    favorites.add(store);
  }

  Future<void> removeFavorite(int id, String username) async {
    await db.deleteFavorite(id, username);

    final storeControl = Get.find<StoreController>();
    final index = storeControl.store.indexWhere((c) => c.id == id);
    if (index != -1) {
      storeControl.store[index].isFavorite.value = false;
    }

    favorites.removeWhere((f) => f.id == id);
  }

  Future<bool> isFavorite(int id, String username) async {
    return await db.isFavorite(id, username);
  }

  Future<void> refreshFavorites() async {
  final username = Get.find<LoginApiController>().username.value;
  if (username.isNotEmpty) {
    await loadFavorites(username);
  }
}


  void clearFavorites() {
  final storeControl = Get.find<StoreController>();
  for (var produk in storeControl.store) {
    produk.isFavorite.value = false;
  }

  favorites.clear();
}

}
