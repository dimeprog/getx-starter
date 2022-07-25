import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var displayUsername = '';
  var displayProfilePhoto = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  var googleSigning = GoogleSignIn();
  var isSignIn = false.obs;

  var googleAccount = Rx<GoogleSignInAccount?>(null);
// getters
  User? get userProfile => _auth.currentUser;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    displayUsername = userProfile != null ? userProfile!.displayName! : '';
  }

// methods
  void signUp(String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  void signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
