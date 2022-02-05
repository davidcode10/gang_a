import 'package:flutter/material.dart';
import 'package:gang_app/global_widgets/animations/overlay_animation_widgets/build_overlay_category.dart';

class BuildOverlayContent extends StatelessWidget {
  const BuildOverlayContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> routesOverlay = [
      '/home',
      '/productForm',
    ];

    List<String> routesName = [
      'HOME',
      'PRODUCTFORM',
    ];
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: routesOverlay.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BuildOverlayCategory(
              routeOverlay: routesOverlay[index],
              routeName: routesName[index],
            ),
          ),
        ),
      ),
    );
  }
}