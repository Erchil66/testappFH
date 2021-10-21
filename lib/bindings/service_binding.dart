import 'package:apptestfh/controllers/service_controller.dart';
import 'package:get/get.dart';

class ServiceBindingAuth extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceController>(() => ServiceController(), fenix: true);
  }
}
