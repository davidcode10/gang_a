import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
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
        Positioned(
          top: 40,
          left: 40,
          child: Text("HOLAAA"),
        ),
        Positioned(
          top: 80,
          left: 40,
          child: Text("ESTE ES OTRO TEXTO"),
        ),
      ],
    );
  }
}