import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/firestore_service/cloud_functions.dart';
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
  @override
  void onReady() {
    print(ConstantCall.firebaseAuth.currentUser!.uid);
    CloudFirebaseFireStoreFunctions.readDataofUser(
            uid: ConstantCall.firebaseAuth.currentUser!.uid)
        .whenComplete(() => storageGetDetail());
    super.onReady();
  }

  final TextEditingController? email = TextEditingController(),
      firstName = TextEditingController(),
      lastName = TextEditingController(),
      phone = TextEditingController();

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

  storageGetDetail() {
    emailString(StoragePref.getIt(holder: StoragePref.email!));
    firstNameString(StoragePref.getIt(holder: StoragePref.firstName!));
    lastNameString(StoragePref.getIt(holder: StoragePref.lastName!));
    phoneString(StoragePref.getIt(holder: StoragePref.phone!));
  }

  @override
  void onClose() {
    Get.delete<MainHomeController>();
    super.onClose();
  }
}
