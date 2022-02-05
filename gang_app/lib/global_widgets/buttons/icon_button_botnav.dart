import 'package:flutter/material.dart';
import 'package:gang_app/theme/color_theme.dart';

class IconButtonBotNav extends StatelessWidget {
  final IconData iconData;
  final int index;
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const IconButtonBotNav({
    Key? key,
    required this.iconData,
    required this.index,
    required this.onIndexChanged,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onIndexChanged.call(index);
        print(index);
      },
      icon: Icon(iconData),
      color: selectedIndex == index ? AppColors.secondary[50] : AppColors.black,
    );
  }
}