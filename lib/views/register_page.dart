import 'package:apptestfh/constatnts/validator.dart';
import 'package:apptestfh/controllers/service_controller.dart';
import 'package:apptestfh/route/route_string.dart';
import 'package:apptestfh/widgets/button.dart';
import 'package:apptestfh/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final serviceController = ServiceController.to;

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formlogR = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () async {
            Get.offAllNamed(RouteString.loginPage!);
            return true;
          },
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formlogR,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: TextFieldFH(
                        hinttext: "Email",
                        editingController: serviceController.email,
                        onChanged: (onchanged) {},
                        onSubmit: (onsubmit) {},
                        width: 250,
                        hieght: 50,
                        validator: (value) => ValidatorString.email(
                            serviceController.email!.text = value!),
                        typeKeyboard: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFieldFH(
                        hinttext: "First name",
                        editingController: serviceController.firstName,
                        onChanged: (onchanged) {},
                        onSubmit: (onsubmit) {},
                        width: 250,
                        hieght: 50,
                        validator: (value) => ValidatorString.dontLeavEmpty(
                            serviceController.firstName!.text = value!),
                        typeKeyboard: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFieldFH(
                        hinttext: "Last name",
                        editingController: serviceController.lastName,
                        onChanged: (onchanged) {},
                        onSubmit: (onsubmit) {},
                        width: 250,
                        hieght: 50,
                        validator: (value) => ValidatorString.dontLeavEmpty(
                            serviceController.lastName!.text = value!),
                        typeKeyboard: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFieldFH(
                        hinttext: "Phone/Mobile number",
                        editingController: serviceController.phone,
                        onChanged: (onchanged) {},
                        onSubmit: (onsubmit) {},
                        width: 250,
                        hieght: 50,
                        validator: (value) => ValidatorString.dontLeavEmpty(
                            serviceController.phone!.text = value!),
                        typeKeyboard: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFieldFH(
                        hinttext: "Password",
                        editingController: serviceController.passwords,
                        onChanged: (onchanged) {},
                        onSubmit: (onsubmit) {},
                        width: 250,
                        hieght: 50,
                        validator: (value) => ValidatorString.passwordss(
                            serviceController.passwords!.text = value!),
                        obsecure: true,
                        typeKeyboard: TextInputType.visiblePassword,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: ButtonFH(
                        press: () => callback(),
                        width: 245,
                        hieght: 50,
                        colorback: Colors.blueAccent,
                        textColor: Colors.white,
                        texttitle: "Sign In",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          )),
        ));
  }

  callback() {
    if (formlogR.currentState!.validate()) {
      serviceController.registerUserEP();
    }
  }
}
