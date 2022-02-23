import 'package:flutter/material.dart';
import 'package:gang_app/routes/app_pages.dart';
import 'package:gang_app/ui/videos/controllers/video_controller.dart';
import 'package:gang_app/ui/videos/widgets/card_image.dart';
import 'package:get/get.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VideoController videoController = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 40.0,
        ),
        onPressed: () {
          Get.toNamed(Routes.VIDEOSFORM);
        },
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 50,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemCount: videoController.videosList.value.length,
            itemBuilder: (context, index) {
              return VideoCard(
                videoModel: videoController.videosList.value[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
