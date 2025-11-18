import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/login_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }
}
