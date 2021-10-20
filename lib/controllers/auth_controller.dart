import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/firestore_service/cloud_functions.dart';
import 'package:apptestfh/route/route_string.dart';
import 'package:apptestfh/storage/storage.dart';
import 'package:apptestfh/widgets/diloag_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  late final Rx<User?> firebaseUser;
  // late final FirebaseFirestore firebaseFirestore;

  @override
  void onReady() {
    super.onReady();
    // firebaseFirestore = FirebaseFirestore.instance;
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

  registerUser(
      {String? email,
      String? password,
      String? firstName,
      String? lastName,
      String? phone,
      String? route}) async {
    DialogWidgetx.loading();
    try {
      await ConstantCall.firebaseAuth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) => CloudFirebaseFireStoreFunctions.addUserDetails(
              uid: value.user!.uid,
              firstName: firstName,
              lastName: lastName,
              email: email,
              phone: phone))
          .whenComplete(
              () => Get.snackbar("User Register", "User Registered Success"));
      Get.toNamed(route!);
    } on FirebaseAuthException catch (firebaseAuthException) {
      Get.snackbar("Try Again", firebaseAuthException.message!);
    }
  }

  loginUser({String? email, String? password, String? route}) async {
    DialogWidgetx.loading();
    try {
      await ConstantCall.firebaseAuth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) => CloudFirebaseFireStoreFunctions.readDataofUser(
              uid: value.user!.uid))
          .whenComplete(() => Get.snackbar("User Login", "User Login Success"));
      Get.toNamed(route!);
    } on FirebaseAuthException catch (firebaseAuthException) {
      Get.snackbar("Try Again", firebaseAuthException.message!);
    }
  }

  updateUserDetailincludeEmail({
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    String? uid,
  }) async {
    DialogWidgetx.loading();
    CloudFirebaseFireStoreFunctions.updateUserDetails(
            email: email!,
            phone: phone!,
            firstName: firstName!,
            lastName: lastName,
            uid: uid!)
        .then((value) => updateRestEmail(email: email))
        .whenComplete(() => Get.snackbar("Update User", "Update User Success"));
  }

  forgotPasswordUser({String? email}) async {
    await ConstantCall.firebaseAuth.sendPasswordResetEmail(email: email!);
    Get.back();
    Get.snackbar("Send Email", "Please Check you email for message");
  }

  signOutUser() async {
    DialogWidgetx.loading();
    await StoragePref.eraseIt();
    await ConstantCall.firebaseAuth.signOut();
    Get.offAllNamed(RouteString.loginPage!);
    Get.snackbar("User SignOut", "User SignOut Success");
  }

  updateRestEmail({String? email}) async {
    await ConstantCall.firebaseAuth.currentUser!
        .updateEmail(email!)
        .then((value) => print("Change email also Success"))
        .catchError((onError) => print(onError));
  }
}
