import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [
      Padding(
          padding: EdgeInsets.only(top: 20),
          child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/image/profile_image.png')))
    ]);
  }
}
