import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/firestore_service/collections.dart';
import 'package:apptestfh/models/user.dart';
import 'package:apptestfh/storage/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CloudFirebaseFireStoreFunctions {
  static Future<void> addUserDetails(
      {String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? uid}) async {
    await CollectionFireStore.collectionReferenceUsers.doc(uid!).set({
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "email": email
    }).then((value) => readDataofUser(uid: uid));
  }

  static Future<void> updateUserDetails(
      {String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? uid}) async {
    await CollectionFireStore.collectionReferenceUsers.doc(uid!).set({
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "email": email
    }).whenComplete(() => readDataofUser(uid: uid));
  }

  static readDataofUser({String? uid}) async {
    final list =
        await CollectionFireStore.collectionReferenceUsers.doc(uid).get();
    final List<dynamic> mapMe = [list.data() as Map<String, dynamic>];
    return mapMe.map((e) => User.fromJson(e)).toList();
  }
}
