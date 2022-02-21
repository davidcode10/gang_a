import 'package:flutter/material.dart';
import 'package:gang_app/services/firestore/firestore_service_message.dart';
import 'package:gang_app/services/firestore/firestore_services.dart';
import 'package:gang_app/ui/auth/controller/auth_controller.dart';
import 'package:gang_app/ui/chat/controllers/message_controller.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessageController messageController = Get.find();
    AuthController authController = Get.find();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            heroTag: 'Others',
            onPressed: () {
              messageController.chargeM.value++;
              DatabaseMessages().chatMessageStream(
                  Get.parameters['roomId']!, messageController.chargeM.value);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        appBar: AppBar(),
        body: Obx(
          () => Stack(
            children: [
              ListView.builder(
                  itemCount: messageController.messages.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 65),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment:
                            (messageController.messages[index].from !=
                                    authController.firestoreUser.value!.uid)
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                                minWidth: 50, maxWidth: 300),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (messageController
                                            .messages[index].from !=
                                        authController.firestoreUser.value!.uid)
                                    ? Colors.grey.shade200
                                    : Colors.blue[100]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (messageController.messages[index].content !=
                                    null)
                                  Text(messageController
                                      .messages[index].content),
                                Text(messageController.messages[index].text!)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: messageController.msgController,
                          minLines: 1,
                          maxLines: 10,
                          onChanged: messageController.getMessages,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            hintText: "Escribe tu mensaje",
                            hintStyle: TextStyle(color: Colors.black38),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          String _messageId =
                              FirestoreService("chat_messages").generateId();
                          DatabaseMessages.addMessage(
                              _messageId,
                              messageController.message.value,
                              Get.parameters['roomId']!);
                          messageController.msgController.clear();
                        },
                        child: Icon(
                          Icons.send,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
