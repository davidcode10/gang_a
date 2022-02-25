import 'package:gang_app/theme/color_theme.dart';
import 'package:gang_app/theme/text_theme.dart';
import 'package:gang_app/ui/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          size: 30,
        ),
        backgroundColor: Colors.green[200],
        onPressed: () {
          Get.back();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Obx(
        () => SingleChildScrollView(
          child: (authController.firestoreUser.value != null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (authController.firestoreUser.value!.photoUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 70.0, left: 80, right: 80),
                        child: ClipRRect(
                          child: Container(
                            color: Colors.green,
                            height: 200,
                            width: 400,
                            child: Image.network(
                              authController.firestoreUser.value!.photoUrl!,
                              fit: BoxFit.fill,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    if (authController.firestoreUser.value!.name != null)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text(
                            authController.firestoreUser.value!.name!,
                            style: textTheme.headline6,
                          ),
                        ),
                      ),
                    if (authController.firestoreUser.value!.email != null)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            authController.firestoreUser.value!.email!,
                            style: textTheme.headline5,
                          ),
                        ),
                      ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 40),
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue[200])),
                          child: const Text(
                            "EDITAR PERFIL",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () async {
                            Get.to(
                              EditProfile(),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 40),
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              AppColors.secondary[100],
                            ),
                          ),
                          child: const Text(
                            "CERRAR SESION",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () async {
                            await authController.signOut();
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
