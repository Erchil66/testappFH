import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/route/route_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  static ServiceController to = Get.find();

  final TextEditingController? email = TextEditingController(),
      firstName = TextEditingController(),
      lastName = TextEditingController(),
      phone = TextEditingController(),
      passwords = TextEditingController(),
      forgotPasswordEmail = TextEditingController();

  registerUserEP() {
    ConstantCall.auth.registerUser(
        email: email!.value.text.trim(),
        password: passwords!.value.text.trim(),
        firstName: firstName!.value.text,
        lastName: lastName!.value.text,
        phone: phone!.value.text,
        route: RouteString.mainhomePage!);
  }

  loginUserEP() {
    ConstantCall.auth.loginUser(
        email: email!.value.text.trim(),
        password: passwords!.value.text.trim(),
        route: RouteString.mainhomePage!);
  }

  @override
  void onClose() {
    Get.delete<ServiceController>();
    email!.clear();
    passwords!.clear();
    phone!.clear();
    firstName!.clear();
    lastName!.clear();
    super.onClose();
  }
}
