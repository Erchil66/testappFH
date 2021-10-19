import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/route/route_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  static ServiceController to = Get.find();

  final TextEditingController? email = TextEditingController(),
      passwords = TextEditingController(),
      forgotPasswordEmail = TextEditingController();

  registerUserEP() {
    ConstantCall.auth.registerUser(
        email: email!.value.text,
        password: passwords!.value.text,
        route: RouteString.mainhomePage!);
  }

  loginUserEP() {
    ConstantCall.auth.loginUser(
        email: email!.value.text,
        password: passwords!.value.text,
        route: RouteString.mainhomePage!);
  }

  @override
  void onClose() {
    email!.clear();
    passwords!.clear();
    forgotPasswordEmail!.clear();
    super.onClose();
  }
}
