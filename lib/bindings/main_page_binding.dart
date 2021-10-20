import 'package:apptestfh/controllers/mainhome_controller.dart';
import 'package:get/get.dart';

class MainHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainHomeController(), fenix: true);
  }
}
