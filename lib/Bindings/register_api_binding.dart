import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_34/Controllers/register_controller.dart';

class RegisterApiBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
  }
}