import 'package:get_storage/get_storage.dart';

class StoragePref {
  static Future init() async => await GetStorage.init();

  static final GetStorage box = GetStorage();

  static const String? firstName = "firstName";
  static const String? lastName = "lastName";
  static const String? email = "email";
  static const String? phone = "phone";

  static Future setDataJson(dynamic data) async => {
        box.write(firstName!, data['firstName']),
        box.write(lastName!, data['lastName']),
        box.write(email!, data['email']),
        box.write(phone!, data['phone']),
      };

  static Future eraseIt() => box.erase();
}
