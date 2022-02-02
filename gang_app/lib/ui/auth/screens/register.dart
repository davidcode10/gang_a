import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:gang_app/ui/auth/controller/auth_controller.dart';
import 'package:gang_app/ui/auth/screens/terms_page.dart';
import 'package:gang_app/utils/form_validators.dart';
import 'package:gang_app/widgets/checkbox_global.dart';
import 'package:gang_app/widgets/global_textfield.dart';
import 'package:gang_app/widgets/show_alert_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Registrar extends StatelessWidget {
  Registrar({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // AuthController authController = AuthController();
    return GetBuilder<AuthController>(
      builder: (authController) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60),
                        Container(
                            padding: const EdgeInsets.only(left: 30),
                            alignment: Alignment.centerLeft,
                            child: const Text("Correo",
                                style: TextStyle(
                                  fontSize: 12,
                                ))),
                        const SizedBox(height: 7),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          width: double.infinity,
                          child: GlobalTextField(
                            validator: FormValidator().isValidEmail,
                            controller: authController.emailController,
                            obscureText: false,
                            hintText: "beer@ejemplo.com",
                            keyboardType: TextInputType.emailAddress,
                            maxLines: 1,
                            minLines: 1,
                            onSave: (value) {
                              authController.emailController.text = value!;
                            },
                          ),
                          // TextFormField(
                          //   keyboardType: TextInputType.emailAddress,
                          //   cursorColor: Colors.black,
                          //   decoration: InputDecoration(
                          //     fillColor: Colors.white,
                          //     filled: true,
                          //     hintText: 'beer@ejemplo.com',
                          //     hintStyle: const TextStyle(
                          //         fontSize: 14, color: Colors.black),
                          //     focusedBorder: const OutlineInputBorder(
                          //         borderSide: BorderSide(color: Colors.black)),
                          //     border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(5)),
                          //   ),
                          //   onChanged: (content) {
                          //     c.controllerCorreo(content);
                          //   },
                          // ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                            padding: const EdgeInsets.only(left: 30),
                            alignment: Alignment.centerLeft,
                            child: const Text("Contraseña",
                                style: TextStyle(
                                  fontSize: 12,
                                ))),
                        const SizedBox(height: 7),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          width: double.infinity,
                          child: Obx(
                            () => GlobalTextField(
                              suffixIcon: IconButton(
                                icon: Icon(
                                    authController.obscureTextPass.value == true
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye_outlined),
                                color: Colors.black,
                                onPressed: () {
                                  authController.obscureTextPass.value =
                                      !authController.obscureTextPass.value;
                                },
                              ),
                              obscureText: authController.obscureTextPass.value,
                              hintText: "Tu contraseña",
                              validator: FormValidator().isValidPassword,
                              keyboardType: TextInputType.text,
                              controller: authController.passController,
                              maxLines: 1,
                              minLines: 1,
                              onSave: (value) =>
                                  authController.passController.text = value!,
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          width: double.infinity,
                          child: Obx(() => GlobalTextField(
                                validator: FormValidator().isValidPassword,
                                controller:
                                    authController.passConfirmController,
                                obscureText:
                                    authController.obscureTextPass.value,
                                hintText: "Repite tuu contraseña",
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                minLines: 1,
                                suffixIcon: IconButton(
                                    icon: Icon(
                                        authController.obscureTextPass.value ==
                                                true
                                            ? Icons.remove_red_eye
                                            : Icons.remove_red_eye_outlined),
                                    color: Colors.black,
                                    onPressed: () {
                                      authController.obscureTextPass.value =
                                          !authController.obscureTextPass.value;
                                    }),
                                onSave: (value) {
                                  authController.passConfirmController.text =
                                      value!;
                                },
                              )),

                          // Obx(
                          //   () => TextFormField(
                          //     obscureText:
                          //         c.contrasenaEye.value == "true" ? true : false,
                          //     cursorColor: Colors.black,
                          //     decoration: InputDecoration(
                          //       suffixIcon: IconButton(
                          //         icon: Icon(c.contrasenaEye.value == "true"
                          //             ? Icons.remove_red_eye
                          //             : Icons.remove_red_eye_outlined),
                          //         color: Colors.black,
                          //         onPressed: () {
                          //           c.controllerEye();
                          //         },
                          //       ),
                          //       fillColor: Colors.white,
                          //       filled: true,
                          //       hintText: 'Tu contraseña',
                          //       hintStyle: const TextStyle(
                          //           fontSize: 14, color: Colors.black),
                          //       focusedBorder: const OutlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.black)),
                          //       border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(5)),
                          //     ),
                          //     onChanged: (content) {
                          //       c.controllerContrasena(content);
                          //     },
                          //   ),
                          // ),
                        ),
                        const SizedBox(height: 22),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 30),
                            child: Row(
                              children: <Widget>[
                                Obx(() => GlobalCheckBox(
                                    value: authController.checkboxValue.value,
                                    onChange: (value) {
                                      authController.checkboxValue.value =
                                          !authController.checkboxValue.value;
                                    })),
                                const SizedBox(width: 5),

                                InkWell(
                                  onTap: () {
                                    authController.checkboxValue.value =
                                        !authController.checkboxValue.value;
                                  },
                                  child: const Text(
                                    "He Leído y accepto las ",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(TermCondition());
                                  },
                                  child: const Text(
                                    "condiciones de uso.",
                                    style: const TextStyle(color: Color(0xFF54AFBC)),
                                  ),
                                )
                                // SizedBox(
                                //     height: 25,
                                //     width: 30,
                                //     child: Obx(() => Checkbox(
                                //         checkColor: Colors.white,
                                //         fillColor: MaterialStateProperty.all(
                                //             Colors.black),
                                //         value: c.checkBox.value,
                                //         onChanged: (content) {
                                //           c.controllerCheckBox(content);
                                //         }))),
                              ],
                            )),
                        const SizedBox(height: 46),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: SignInButton(
                              Buttons.Google,
                              text: "Registro con Google",
                              onPressed: () async {
                                await authController.signInGoogle();
                                // await authController.signInAnonymous();
                                //Get.to(Home());
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 150),
                        Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
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
                                        const Color(0xFF8FD974))),
                                child: const Text("CREAR CUENTA",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                onPressed: () async {
                                  if (authController.checkboxValue.value ==
                                      false) {
                                    showAlertDialog(context, "Error",
                                        "Debes aceptar las condiciones de uso");
                                  } else if (authController
                                          .passController.value !=
                                      authController
                                          .passConfirmController.value) {
                                    showAlertDialog(context, "Error",
                                        "Las contraseñas no son iguales");
                                  } else if (_formKey.currentState!
                                      .validate()) {
                                    await authController
                                        .registerWithEmailAndPassword(context);
                                    // Get.to(Home());
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(
                                    //   SnackBar(
                                    //     duration: Duration(seconds: 3),
                                    //     content: Text(
                                    //         'Recibiras un email de confirmación, luego podrás realizar el Login'),
                                    //   ),
                                    // );
                                  }
                                }),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget btnText(String text, headline1) {
    return Text(
      text,
      style: headline1,
    );
  }
}