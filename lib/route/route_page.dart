import 'package:apptestfh/bindings/main_page_binding.dart';
import 'package:apptestfh/bindings/service_binding.dart';
import 'package:apptestfh/route/route_string.dart';
import 'package:apptestfh/views/login_page.dart';
import 'package:apptestfh/views/main_page.dart';
import 'package:apptestfh/views/register_page.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class RoutePages {
  static final routePages = [
    GetPage(
        name: RouteString.loginPage!,
        transition: Transition.leftToRight,
        transitionDuration: 450.milliseconds,
        curve: Curves.easeIn,
        page: () => LoginViewPage(),
        binding: ServiceBindingAuth()),
    GetPage(
        name: RouteString.registerPage!,
        transition: Transition.leftToRight,
        transitionDuration: 450.milliseconds,
        curve: Curves.easeIn,
        page: () => RegisterPage(),
        binding: ServiceBindingAuth()),
    GetPage(
        name: RouteString.mainhomePage!,
        transition: Transition.leftToRight,
        transitionDuration: 450.milliseconds,
        curve: Curves.easeIn,
        page: () => const MainViewPage(),
        binding: MainHomeBinding()),
  ];
}
