import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoController extends GetxController {
  late YoutubePlayerController youtubePlayerController;
  Rx<bool> isPlayerReady = false.obs;

  final String videoUrlUid;

  PlayVideoController({required this.videoUrlUid});

  @override
  void onInit() {
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: _convertYoutubeID(videoUrlUid),
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          forceHD: false,
          enableCaption: true,
          loop: false,
          isLive: false,
        ));

    super.onInit();
  }

  _convertYoutubeID(String videoUrlUid) {
    try {
      YoutubePlayer.convertUrlToId(videoUrlUid);
      if (YoutubePlayer.convertUrlToId(videoUrlUid) != null) {
        return YoutubePlayer.convertUrlToId(videoUrlUid);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }
}