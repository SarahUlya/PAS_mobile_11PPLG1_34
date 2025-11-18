import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeController());
  }
}