import 'package:gang_app/ui/auth/screens/intro_screen.dart';
import 'package:gang_app/ui/auth/screens/loading_page.dart';
import 'package:gang_app/ui/home/bindings/nav_binding.dart';
import 'package:gang_app/ui/home/screens/home_screen.dart';
import 'package:gang_app/ui/products/bindings/product_binging.dart';
import 'package:gang_app/ui/products/pages/product_form.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL_LOGGED = Routes.HOME;
  static const INITIAL_NOT_LOGGED = Routes.INTRO;

  static final routes = [
    GetPage(
      name: Routes.LOADING,
      page: () => LoadingScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      bindings: [
        NavBinding(),
      ],
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
    ),
    GetPage(
      name: Routes.PRODUCTFORM,
      page: () => ProductForm(),
      binding: ProductBinding(),
    ),
  ];
}