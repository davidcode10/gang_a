import 'package:flutter/material.dart';
import 'package:gang_app/ui/profile/screens/profile_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';

class PrincipalProfile extends StatelessWidget {
  const PrincipalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 30),
        children: [
          //Share social media
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(
                Icons.share,
                size: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right,
              size: 30,
            ),
            title: const Text("Share"),
            subtitle: const Text("Comparte con tus amigos"),
            onTap: () {
              _onShare(context);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          //Settings
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding:
                const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            leading: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Icon(
                Icons.settings,
                size: 18,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right,
              size: 30,
            ),
            title: const Text("Settings"),
            subtitle: const Text("Configura tu perfil"),
            onTap: () {
              Get.to(
                const ProfileScreen(),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(
      'check out my website https://example.com',
      subject: 'Look what I made!',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}