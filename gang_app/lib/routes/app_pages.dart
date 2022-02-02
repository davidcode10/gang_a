import 'package:gang_app/ui/auth/screens/home_page.dart';
import 'package:gang_app/ui/auth/screens/intro_page.dart';
import 'package:gang_app/ui/auth/screens/loading_page.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL_LOGGED = Routes.HOME;
  static const INITIAL_NOT_LOGGED = Routes.INTRO;

  static final routes = [
    GetPage(
      name: Routes.LOADING,
      page: () => LoadingPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => Intro(),
    ),
  ];
}