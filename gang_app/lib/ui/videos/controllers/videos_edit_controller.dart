import 'package:flutter/material.dart';
import 'package:gang_app/model/video_model.dart';
import 'package:gang_app/services/firestore/firestore_service_videos.dart';
import 'package:get/get.dart';

class VideosEditController extends GetxController {
  DataBaseVideos dataBaseVideos = DataBaseVideos();
  TextEditingController titleVideo = TextEditingController();
  TextEditingController subtitleVideo = TextEditingController();
  TextEditingController urlVideo = TextEditingController();

  Rx<String> urlImage = ''.obs;
  Rx<String> pathImage = ''.obs;
  Rx<String> uidVideo = ''.obs;

  Future<bool> createVideo(VideoModel video) async {
    return dataBaseVideos.createNewVideo(video);
  }
}
