import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gang_app/model/product_model.dart';
import 'package:gang_app/model/user_model.dart';
import 'package:gang_app/model/video_model.dart';
import 'package:gang_app/ui/auth/controller/auth_controller.dart';
import 'package:gang_app/ui/products/controllers/product_edit_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class GetImage {
  late String urlGetImage;
  late String pathImage;
  // final AuthController authController = Get.find();
  final picker = ImagePicker();

  Future uploadFileVideo(BuildContext context, File imageProfile,
      String videoUid, VideoModel updateVideo) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesVideos/$videoUid');
    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);
    await uploadTask.whenComplete(() async {
      await storageReference.getDownloadURL().then((url) {
        urlGetImage = url;
        updateVideo.urlImage = url;
      });
    });
  }

  Future uploadFileProduct(BuildContext context, File imageProfile,
      String productUid, ProductModel updateProduct) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProducts/$productUid');

    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);

    await uploadTask.whenComplete(
      () async {
        await storageReference.getDownloadURL().then((url) {
          urlGetImage = url;

          updateProduct.photoUrl = url;

          // productController.createProduct(updateProduct);
        });
      },
    );
  }

  Future uploadFileUser(
      BuildContext context, File imageProfile, UserModel updatedUser) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProfile/${updatedUser.uid}');

    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);

    await uploadTask.whenComplete(
      () async {
        await storageReference.getDownloadURL().then((url) {
          urlGetImage = url;
          updatedUser.photoUrl = url;
        });
      },
    );
  }

  Future<String> _imgFromGallery(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    print(image!.path);

    pathImage = image.path;

    return pathImage;
    // await _uploadFile(context, File(image.path));
  }

  Future _imgFromCamera(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    print(image!.path);

    pathImage = image.path;

    return pathImage;

    // await _uploadFile(context, File(image.path));
  }

  Future showPicker(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
            child: Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Acceder a la galeria"),
                onTap: () async {
                  await _imgFromGallery(context);
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("Acceder a la c??mara"),
                onTap: () async {
                  await _imgFromCamera(context);
                  Get.back();
                },
              ),
            ],
          ),
        ));
      },
    );
  }
}
