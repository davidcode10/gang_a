import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gang_app/global_widgets/get_image/get_image.dart';
import 'package:gang_app/global_widgets/global_textfield.dart';
import 'package:gang_app/model/user_model.dart';
import 'package:gang_app/theme/color_theme.dart';
import 'package:gang_app/ui/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatelessWidget {
  final AuthController authController = Get.find();

  final picker = ImagePicker();

  EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetImage getImage = GetImage();
    return Scaffold(
      body: Obx(
        () => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: AppColors.secondary[100],
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (authController.firestoreUser.value!.photoUrl != null)
              Padding(
                padding: const EdgeInsets.only(top: 70.0, left: 80, right: 80),
                child: ClipRRect(
                  child: (authController.pathImageUser.value != '')
                      ? Container(
                          color: Colors.green,
                          height: 200,
                          width: 400,
                          child: Image.file(
                              File(authController.pathImageUser.value))

                          //  Image.network(
                          //   authController.firestoreUser.value!.photoUrl!,
                          //   fit: BoxFit.fill,
                          // ),
                          )
                      : Container(),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
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
                    "EDITAR FOTO",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    await getImage.showPicker(context);
                    print(getImage.pathImage);
                    authController.pathImageUser.value = getImage.pathImage;

                    // print(GetImage().urlImage);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                width: double.infinity,
                child: GlobalTextField(
                  controller: authController.nameController..text = 'Username',
                  obscureText: false,
                  hintText: "Tu nombre",
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  minLines: 1,
                  onSave: (value) {
                    authController.nameController.text = value!;
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
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
                    "EDITAR NOMBRE",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    if (authController.nameController.text != "") {
                      UserModel _updatedUser = UserModel(
                        uid: authController.firestoreUser.value!.uid,
                        email: authController.firestoreUser.value!.email,
                        name: authController.nameController.text,
                        photoUrl: authController.firestoreUser.value!.photoUrl,
                      );
                      authController.updateUser(_updatedUser);
                    }
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
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
                    "GUARDAR",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    if (authController.pathImageUser.value != '') {
                      UserModel _updatedUser = UserModel(
                          uid: authController.firestoreUser.value!.uid,
                          email: authController.firestoreUser.value!.email,
                          name: authController.firestoreUser.value!.name,
                          photoUrl:
                              authController.firestoreUser.value!.photoUrl);
                      await getImage.uploadFileUser(
                          context,
                          File(authController.pathImageUser.value),
                          _updatedUser);
                      authController.updateUser(_updatedUser);
                    }
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
