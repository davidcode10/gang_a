import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gang_app/global_widgets/get_image/get_image.dart';
import 'package:gang_app/global_widgets/global_textfield.dart';
import 'package:gang_app/model/video_model.dart';
import 'package:gang_app/services/firestore/firestore_service_videos.dart';
import 'package:gang_app/ui/utils/form_validator.dart';
import 'package:gang_app/ui/videos/controllers/videos_edit_controller.dart';
import 'package:get/get.dart';

class VideosForm extends StatelessWidget {
  const VideosForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    GetImage getImage = GetImage();

    VideosEditController videosEditController = Get.find();
    DataBaseVideos dataBaseVideos = DataBaseVideos();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          size: 40,
        ),
        backgroundColor: Colors.green[100],
        onPressed: () {
          Get.back();
        },
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.only(top: 70.0, left: 80, right: 80),
                  child: ClipRRect(
                    child: (videosEditController.pathImage.value != '')
                        ? Container(
                            color: Colors.green,
                            height: 200,
                            width: 400,
                            child: Image.file(
                                File(videosEditController.pathImage.value))

                            //  Image.network(
                            //   authController.firestoreUser.value!.photoUrl!,
                            //   fit: BoxFit.fill,
                            // ),
                            )
                        : Container(
                            color: Colors.green,
                            height: 200,
                            width: 400,
                          ),
                    borderRadius: BorderRadius.circular(50),
                  ),
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
                      videosEditController.pathImage.value = getImage.pathImage;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: GlobalTextField(
                    controller: videosEditController.titleVideo,
                    obscureText: false,
                    hintText: "Introduce el título del video",
                    keyboardType: TextInputType.emailAddress,
                    validator: FormValidator().isValidName,
                    maxLines: 1,
                    minLines: 1,
                    onSave: (value) {
                      videosEditController.titleVideo.text = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: GlobalTextField(
                    controller: videosEditController.subtitleVideo,
                    obscureText: false,
                    hintText: "Introduce el subtítulo del video",
                    keyboardType: TextInputType.name,
                    validator: FormValidator().isValidName,
                    maxLines: 1,
                    minLines: 1,
                    onSave: (value) {
                      videosEditController.subtitleVideo.text = value!;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: GlobalTextField(
                    controller: videosEditController.urlVideo,
                    obscureText: false,
                    hintText: "Introduce el url del video",
                    keyboardType: TextInputType.emailAddress,
                    validator: FormValidator().isValidName,
                    maxLines: 1,
                    minLines: 1,
                    onSave: (value) {
                      videosEditController.urlVideo.text = value!;
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 40, top: 40),
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
                        "ENVIAR DATOS",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        videosEditController.uidVideo.value =
                            dataBaseVideos.generateIdVideos();

                        VideoModel newVideo = VideoModel(
                          uid: videosEditController.uidVideo.value,
                          title: videosEditController.titleVideo.text,
                          urlVideo: videosEditController.urlVideo.text,
                          subtitle: videosEditController.subtitleVideo.text,
                        );
                        // ProductModel newProduct = ProductModel(
                        //     uid: productEditController.productUid.value,
                        //     name: productEditController.nameProduct.text,
                        //     description:
                        //         productEditController.descriptionProduct.text,
                        //     originalPrice:
                        //         productEditController.originalPrice.text + "€",
                        //     realPrice:
                        //         productEditController.realPrice.text + "€",
                        //     productCategory:
                        //         productEditController.dropdownValue.value);
                        // print(newProduct.uid);
                        // print(newProduct.photoUrl);

                        if (videosEditController.pathImage.value != '') {
                          await getImage.uploadFileVideo(
                            context,
                            File(videosEditController.pathImage.value),
                            videosEditController.uidVideo.value,
                            newVideo,
                          );

                          videosEditController.createVideo(newVideo);
                        }

                        Get.back();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
