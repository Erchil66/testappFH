import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/firestore_service/cloud_functions.dart';
import 'package:apptestfh/models/user.dart';
import 'package:apptestfh/route/route_string.dart';
import 'package:apptestfh/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainHomeController extends GetxController {
  static MainHomeController to = Get.find();
  final emailString = '...'.obs;
  final firstNameString = '...'.obs;
  final lastNameString = '...'.obs;
  final phoneString = '...'.obs;

  final box = GetStorage();

  @override
  void onInit() {
    getListtrail();
    super.onInit();
  }

  final TextEditingController? email = TextEditingController(),
      firstName = TextEditingController(),
      lastName = TextEditingController(),
      phone = TextEditingController();

  final List<User> listUser = <User>[].obs;

  getListtrail() async {
    try {
      final result = await CloudFirebaseFireStoreFunctions.readDataofUser(
          uid: ConstantCall.firebaseAuth.currentUser!.uid);
      listUser.assignAll(result);
    } finally {
      listUser.map((e) {
        box.write('u.f', e.firstName);
        box.write('u.l', e.lastName);
        box.write('u.e', e.email);
        box.write('u.p', e.phone);
      }).toList();
      getStored();
    }
  }

  updateUserDetailWithEmailAlso() async {
    ConstantCall.auth.updateUserDetailincludeEmail(
        firstName: firstName!.value.text.isEmpty
            ? firstNameString.value
            : firstName!.value.text,
        lastName: lastName!.value.text.isEmpty
            ? lastNameString.value
            : lastName!.value.text,
        phone:
            phone!.value.text.isEmpty ? phoneString.value : phone!.value.text,
        email:
            email!.value.text.isEmpty ? emailString.value : email!.value.text,
        uid: ConstantCall.firebaseAuth.currentUser!.uid);
  }

  getStored() {
    firstNameString(box.read('u.f'));
    lastNameString(box.read('u.l'));
    emailString(box.read('u.e'));
    phoneString(box.read('u.p'));
  }

  signOutNowOkay() {
    box.remove('u.f');
    box.remove('u.l');
    box.remove('u.e');
    box.remove('u.p');
    ConstantCall.firebaseAuth.signOut().then(
        (value) => Get.offNamedUntil(RouteString.loginPage!, (route) => false));
  }

  @override
  void onClose() {
    Get.delete<MainHomeController>();
    super.onClose();
  }
}
