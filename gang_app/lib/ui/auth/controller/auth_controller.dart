import 'dart:developer';
import 'package:gang_app/global_widgets/show_alert_dialog.dart';
import 'package:gang_app/model/user_model.dart';
import 'package:gang_app/routes/app_pages.dart';
import 'package:gang_app/services/firestore/firestore_service_user.dart';
import 'package:gang_app/ui/auth/screens/login_register_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GoogleSignIn _googleSignIn = GoogleSignIn();
  RxBool checkboxValue = false.obs;
  RxBool obscurePassConfirmation = true.obs;
  RxBool obscureTextPass = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    nameController.dispose();
    passConfirmController.dispose();
    super.onClose();
  }

  @override
  void onReady() async {
    //run every time auth state change
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);
    super.onReady();
  }

  //Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      if (firebaseUser.value?.isAnonymous == false) {
        firestoreUser.bindStream(streamFirestoreUser());
      }
    }

    if (_firebaseUser == null) {
      Get.offAll(LoginRegisterScreen());
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return _db.doc('/users/${firebaseUser.value!.uid}').get().then(
        (documentSnapshot) => UserModel.fromJson(documentSnapshot.data()!));
  }

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    return _db
        .doc('users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) {
      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    });
  }

  Future<User> signInAnonymous() async {
    UserCredential result = await _auth.signInAnonymously();

    return result.user!;
  }

  Future<void> updateUser(UserModel user) async {
    try {
      _db.doc('/users/${user.uid}').update(user.toJson());
      update();
    } catch (err) {
      log("$err");
    }
  }

  registerWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      )
          .then((result) async {
        UserModel _newUser = UserModel(
          uid: result.user!.uid,
          email: result.user!.email,
          name: "user",
          photoUrl: "/assets/image/profile_image.png",
        );
        DatabaseUsers().createNewUser(_newUser);
      });
    } on FirebaseAuthException catch (error) {
      showAlertDialog(context, "Error", "${error.message}");
    }
  }

  signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
      emailController.clear();
      passController.clear();
      Get.snackbar(
        "Your data is correct",
        "Wellcome",
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (err) {
      Get.snackbar(
        "Error",
        "Your data is incorrect",
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(err);
    }
  }

  Future<User?> signInGoogle() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);

      UserModel _newUser = UserModel(
        uid: result.user!.uid,
        email: result.user!.email,
        name: result.user!.displayName!,
        photoUrl: result.user!.photoURL!,
      );

      DatabaseUsers().createNewUser(_newUser);
      //get token of mobile
      _firebaseMessaging.getToken().then((token) {
        saveTokens(token);
      });

      return result.user;
    }

    return null;
  }

  //Pasword reset email
  Future<void> sendPasswordResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar("OYE USUARIOOOO", "TE HEMOS ENVIADO UN EMAIL");
    } on FirebaseAuthException catch (error) {
      print(error.message);
    }
  }

  Future<void> saveTokens(var token) async {
    try {
      await _db.collection('tokens').doc(token).set({
        'token': token,
      });
    } catch (e) {
      print(e);
    }
  }

  // Sign out
  Future<void> signOut() {
    _googleSignIn.signOut();
    return _auth.signOut();
  }
}