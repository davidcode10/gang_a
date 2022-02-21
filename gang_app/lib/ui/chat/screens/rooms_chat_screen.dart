import 'package:flutter/material.dart';
import 'package:gang_app/ui/chat/controllers/message_controller.dart';
import 'package:get/get.dart';

class RoomsChatScreen extends StatelessWidget {
  const RoomsChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.network(
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        ListView.builder(
          itemCount: roomsChats.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Card(
                color: Colors.white,
                child: ListTile(
                  trailing: Icon(Icons.chat),
                  title: Text(
                    roomsChats[index],
                  ),
                  onTap: () {
                    Get.toNamed("/chat/${roomsChats[index]}");
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
