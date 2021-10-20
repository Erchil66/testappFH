import 'package:apptestfh/constatnts/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class StoragePref {
  static final box = ConstantCall.box;

  static const String? firstName = "firstName";
  static const String? lastName = "lastName";
  static const String? email = "email";
  static const String? phone = "phone";

  static setDataJson(DocumentSnapshot<Object?> data) {
    box.write(firstName!, data['firstName']);
    box.write(lastName!, data['lastName']);
    box.write(email!, data['email']);
    box.write(phone!, data['phone']);
  }

  static Future<void> eraseIt() async {
    box.remove(firstName!);
    box.remove(lastName!);
    box.remove(email!);
    box.remove(phone!);
  }

  static getIt({String? holder}) => box.read(holder!);
}
