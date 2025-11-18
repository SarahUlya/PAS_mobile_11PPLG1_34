import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/API/store_api.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_34/Models/store_model.dart';

class StoreController extends GetxController {
  var store = <TabelModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStore();
  }

  Future<void> fetchStore() async {
    try {
      isLoading(true);
      final data = await ApiService.getCats();

      final favs = Get.find<FavoriteController>().favorites;
      final favIds = favs.map((f) => f.id).toSet();
      for (var cat in data) {
        cat.isFavorite.value = favIds.contains(cat.id);
      }
      
      store.assignAll(data);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
