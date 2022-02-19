import 'package:flutter/material.dart';
import 'package:gang_app/model/message_model.dart';
import 'package:gang_app/services/firestore/firestore_service_message.dart';
import 'package:get/get.dart';

List<String> roomsChats = ['General', 'Sports', 'Cinema', 'Music'];

class MessageController extends GetxController {
  TextEditingController msgController = TextEditingController();
  Rx<String> message = "".obs;
  Rx<int> chargeM = 0.obs;
  Rx<List<MessageModel>> messagesList = Rx<List<MessageModel>>([]);
  List<MessageModel> get messages => messagesList.value.obs;

  getMessages(String value) => message.value = value;

  @override
  void onReady() {
    messagesList.bindStream(DatabaseMessages()
        .chatMessageStrem(Get.parameters['roomId']!, chargeM.value));
    super.onReady();
  }

  @override
  void onClose() {
    msgController.dispose();
    super.onClose();
  }
}
