import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20&%20firebase/root.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  // variables
  var displayName = '';
  var displayProfilePhoto = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var isSignIn = false.obs;
  var googleAccount = Rx<GoogleSignInAccount?>(null);

// getters
  User? get userProfile => _auth.currentUser;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    displayName = userProfile != null ? userProfile!.displayName! : '';
  }

// methods
  void signUp(String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) {
          displayName = name;
          _auth.currentUser!.updateDisplayName(name);
        },
      );

      isSignIn = true.obs;
      update();
      Get.offAll(() => const Root());
    } on FirebaseAuthException catch (err) {
      String? title = err.code.replaceAll(RegExp('-'), ' ').capitalize;
      String msg = ' ';

      if (err.code == 'weak-password') {
        msg = 'provided password is too weak';
      } else if (err.code == 'email-already-exists') {
        msg = 'email is already in used';
      } else {
        msg = err.message.toString();
      }
      Get.snackbar(
        'Error!',
        msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (err) {
      Get.snackbar(
        'Error!',
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signIn(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayName = userProfile!.displayName!);
      isSignIn = true.obs;
      update();
      Get.offAll(() => const Root());
    } on FirebaseAuthException catch (err) {
      String? title = err.code.replaceAll(RegExp('-'), ' ').capitalize;
      String msg = '';
      if (err.code == 'wrong password') {
        msg = 'wrong password... please enter your correct password';
      } else if (err.code == 'user-not-found') {
        msg = 'Account dont exist... please try to sign up...';
      } else {
        msg = err.message.toString();
      }
      Get.snackbar(
        title.toString(),
        msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (err) {
      Get.snackbar(
        'Error!',
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void googleSignInUser() async {
    try {
      googleAccount.value = await googleSignIn.signIn();
      displayName = googleAccount.value!.displayName!;
      displayProfilePhoto = googleAccount.value!.photoUrl!;
      isSignIn.value = true;
      update();
    } catch (err) {
      Get.snackbar(
        'Error!',
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
      Get.back();
      update();
    } on FirebaseAuthException catch (err) {
      String? title = err.code.replaceAll(RegExp('-'), ' ').capitalize;
      String msg = '';
      if (err.code == 'user-not-found') {
        msg = 'Account dont exist... please try to sign up...';
      } else {
        err.message.toString();
      }
      Get.snackbar(
        title.toString(),
        msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (err) {
      Get.snackbar(
        'Error!',
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      await googleSignIn.signOut();
      displayName = '';
      displayProfilePhoto = '';
      update();
    } catch (err) {
      Get.snackbar(
        'Error!',
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}

extension StrinegExtension on String {
  String capitalizeString() {
    return '${this[0].toUpperCase()} ${this.substring(1).toLowerCase()}';
  }
}
