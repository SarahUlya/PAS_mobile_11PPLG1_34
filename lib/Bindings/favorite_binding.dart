import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/favorite_controller.dart';

class FavoriteBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(FavoriteController());
  }
}