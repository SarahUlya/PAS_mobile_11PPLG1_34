import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_mobile_11pplg1_34/Bindings/home_binding.dart';
import 'package:pas_mobile_11pplg1_34/Bindings/login_api_binding.dart';
import 'package:pas_mobile_11pplg1_34/Bindings/register_api_binding.dart';
import 'package:pas_mobile_11pplg1_34/Bindings/splash_binding.dart';
import 'package:pas_mobile_11pplg1_34/Pages/login_user.dart';
import 'package:pas_mobile_11pplg1_34/Pages/main_nav_page.dart';
import 'package:pas_mobile_11pplg1_34/Pages/register_user.dart';
import 'package:pas_mobile_11pplg1_34/Pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg1_34/Pages/store_detail.dart';
import 'package:pas_mobile_11pplg1_34/Routes/routes.dart';


class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen(), binding: SplashBinding()),
    GetPage(name: AppRoutes.login, page: () => LoginPage1(), binding: LoginApiBinding()),
    GetPage(name: AppRoutes.register, page: () => RegisterUser(), binding: RegisterApiBinding()),
    GetPage(name: AppRoutes.home, page: () => MainNavPage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.detail, page: () => StoreDetail()),

    // add other collection
  ];
}