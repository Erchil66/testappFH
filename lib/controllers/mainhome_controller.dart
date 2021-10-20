import 'dart:convert';

import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/firestore_service/cloud_functions.dart';
import 'package:apptestfh/firestore_service/collections.dart';
import 'package:apptestfh/models/user.dart';
import 'package:apptestfh/storage/storage.dart';
import 'package:apptestfh/widgets/diloag_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeController extends GetxController {
  static MainHomeController to = Get.find();

  @override
  void onReady() {
    storageGetDetail();
    super.onReady();
  }

  final TextEditingController? email = TextEditingController(),
      firstName = TextEditingController(),
      lastName = TextEditingController(),
      phone = TextEditingController();
  final emailString = ''.obs;
  final firstNameString = ''.obs;
  final lastNameString = ''.obs;
  final phoneString = ''.obs;

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
    StoragePref.box.listen(() {
      storageGetDetail();
    });
  }

  storageGetDetail() {
    emailString(StoragePref.box.read(StoragePref.email!));
    firstNameString(StoragePref.box.read(StoragePref.firstName!));
    lastNameString(StoragePref.box.read(StoragePref.lastName!));
    phoneString(StoragePref.box.read(StoragePref.phone!));
    emailString(StoragePref.box.read(StoragePref.email!));
  }

  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }
}
