import 'package:gang_app/ui/auth/screens/intro_screen.dart';
import 'package:gang_app/ui/auth/screens/loading_page.dart';
import 'package:gang_app/ui/chat/bindings/message_binding.dart';
import 'package:gang_app/ui/chat/screens/chat_screen.dart';
import 'package:gang_app/ui/home/bindings/nav_binding.dart';
import 'package:gang_app/ui/home/screens/home_screen.dart';
import 'package:gang_app/ui/products/bindings/product_binging.dart';
import 'package:gang_app/ui/products/bindings/product_edit_binding.dart';
import 'package:gang_app/ui/products/pages/product_form.dart';
import 'package:gang_app/ui/proof/bindings/product_proof_binding.dart';
import 'package:gang_app/ui/videos/bindings/video_binding.dart';
import 'package:gang_app/ui/videos/bindings/videos_edit_binding.dart';
import 'package:gang_app/ui/videos/screens/videos_form.dart';
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
        ProductBinding(),
        VideoBinding(),
        ProductProofBinding()
      ],
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroScreen(),
    ),
    GetPage(
      name: Routes.PRODUCTFORM,
      page: () => ProductForm(),
      binding: ProductEditBinding(),
    ),
    GetPage(
        name: Routes.CHAT, page: () => ChatScreen(), binding: MessageBinding()),
    GetPage(
        name: Routes.VIDEOSFORM,
        page: () => VideosForm(),
        binding: VideosEditBinding())
  ];
}
