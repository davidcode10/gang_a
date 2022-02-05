import 'package:flutter/material.dart';
import 'package:gang_app/routes/app_pages.dart';
import 'package:gang_app/ui/home/controllers/nav_controller.dart';
import 'package:get/get.dart';

class BuildOverlayCategory extends StatelessWidget {
  final String routeOverlay;
  final String routeName;
  const BuildOverlayCategory({
    Key? key,
    required this.routeOverlay,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavController navController = Get.find();
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            if (routeOverlay == Routes.HOME) {
              navController.index.value = 0;
            }
            Get.back();
            await Get.toNamed(routeOverlay);
          },
          child: Container(
            height: 60,
            child: Center(
              child: Text(
                routeName,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}