import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/controllers/auth_controller.dart';
import 'package:apptestfh/route/route_page.dart';
import 'package:apptestfh/route/route_string.dart';
import 'package:apptestfh/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StoragePref.init();
  await ConstantCall.firebaseApp
      .then((_) => Get.put(AuthController(), permanent: true));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteString.loginPage!,
      getPages: RoutePages.routePages,
    );
  }
}
