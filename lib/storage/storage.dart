import 'package:apptestfh/constatnts/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class StoragePref {
  static final box = GetStorage();

  static const String? firstName = "user.firstName";
  static const String? lastName = "user.lastName";
  static const String? email = "user.email";
  static const String? phone = "user.phone";

  static setDataJson(DocumentSnapshot<Object?> data) {
    box.write('user.firstName', data['firstName']);
    box.write('user.lastName', data['lastName']);
    box.write('user.email', data['email']);
    box.write('user.phone', data['phone']);
  }

  static Future<void> eraseIt() async {
    box.remove('user.firstName');
    box.remove('user.lastName');
    box.remove('user.email');
    box.remove('user.phone');
    box.erase();
    print("On Process Remove");
  }

  static getIt({String? holder}) => box.read(holder!);
}
