import 'package:flutter/material.dart';
import 'package:gang_app/global_widgets/buttons/icon_button_botnav.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;
  const CustomNavigationBar(
      {Key? key, required this.selectedIndex, required this.onIndexChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButtonBotNav(
              index: 0,
              selectedIndex: selectedIndex,
              onIndexChanged: onIndexChanged,
              iconData: Icons.home,
            ),
            IconButtonBotNav(
              index: 1,
              selectedIndex: selectedIndex,
              onIndexChanged: onIndexChanged,
              iconData: Icons.star,
            ),
            IconButtonBotNav(
              index: 2,
              selectedIndex: selectedIndex,
              onIndexChanged: onIndexChanged,
              iconData: Icons.shop,
            ),
            IconButtonBotNav(
              index: 3,
              selectedIndex: selectedIndex,
              onIndexChanged: onIndexChanged,
              iconData: Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}