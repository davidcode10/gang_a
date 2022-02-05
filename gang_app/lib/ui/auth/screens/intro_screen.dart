import 'package:flutter/material.dart';
import 'package:gang_app/theme/color_theme.dart';
import 'package:gang_app/theme/gangapp_icons.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: AppColors.secondary[200],
          child: Icon(GangappIcons.search_product),
        ),
      ),
    );
  }
}