import 'package:flutter/material.dart';
import 'package:gang_app/ui/videos/controllers/play_video_controller.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailsScreen extends StatelessWidget {
  // final String videoUrl;
  const VideoDetailsScreen({
    Key? key,
    // required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayVideoController>(
      init: PlayVideoController(videoUrlUid: Get.arguments["videoUrl"]),
      builder: (controller) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print(Get.arguments["videoUrl"]);
            },
          ),
          body: YoutubePlayerBuilder(
            player: YoutubePlayer(
              onEnded: (metadata) {
                Get.back();
              },
              aspectRatio: 1,
              controller: controller.youtubePlayerController,
            ),
            builder: (context, player) => Scaffold(
              appBar: AppBar(),
              body: Container(
                child: player,
              ),
            ),
          ),
        );
      },
    );
  }
}
