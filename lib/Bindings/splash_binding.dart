import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/splashscreen_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashscreenController());
  }
}