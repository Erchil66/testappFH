import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/route/route_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(ConstantCall.firebaseAuth.currentUser);
    firebaseUser.bindStream(ConstantCall.firebaseAuth.userChanges());
    ever(firebaseUser, redirectCallback);
  }

  redirectCallback(User? user) {
    if (user != null) {
      Get.offNamed(RouteString.mainhomePage!);
    } else {
      Get.offNamed(RouteString.loginPage!);
    }
  }

  registerUser({String? email, String? password, String? route}) async {
    try {
      await ConstantCall.firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      Get.toNamed(route!);
      Get.snackbar("User Register", "User Registered Success");
    } on FirebaseAuthException catch (firebaseAuthException) {
      Get.snackbar("Try Again", firebaseAuthException.message!);
    }
  }

  loginUser({String? email, String? password, String? route}) async {
    try {
      await ConstantCall.firebaseAuth
          .signInWithEmailAndPassword(email: email!, password: password!);
      Get.toNamed(route!);
      Get.snackbar("User Login", "User Login Success");
    } on FirebaseAuthException catch (firebaseAuthException) {
      Get.snackbar("Try Again", firebaseAuthException.message!);
    }
  }

  forgotPasswordUser({String? email}) async {
    await ConstantCall.firebaseAuth.sendPasswordResetEmail(email: email!);
    Get.back();
    Get.snackbar("Send Email", "Please Check you email for message");
  }

  signOutUser() async {
    await ConstantCall.firebaseAuth.signOut();
    Get.offAllNamed(RouteString.loginPage!);
    Get.snackbar("User SignOut", "User SignOut Success");
  }
}
