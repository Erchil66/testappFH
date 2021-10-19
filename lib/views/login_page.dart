import 'package:apptestfh/constatnts/validator.dart';
import 'package:apptestfh/controllers/service_controller.dart';
import 'package:apptestfh/widgets/button.dart';
import 'package:apptestfh/widgets/diloag_widget.dart';
import 'package:apptestfh/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

final serviceController = ServiceController.to;

class LoginViewPage extends StatelessWidget {
  LoginViewPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formlog = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formlog,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
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
                    press: () {
                      if (formlog.currentState!.validate()) {
                        serviceController.loginUserEP();
                      }
                    },
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
                const Center(
                  child: Text("OR"),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: ButtonFH(
                    press: () {
                      if (formlog.currentState!.validate()) {
                        serviceController.registerUserEP();
                      }
                    },
                    width: 245,
                    hieght: 50,
                    colorback: Colors.blueAccent,
                    textColor: Colors.white,
                    texttitle: "Sign Up",
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.grey[50]),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: GestureDetector(
            onTap: () => DialogWidgetx.dialogForgotPass(
                serviceController.forgotPasswordEmail),
            child: const Center(
              child: Text("Forgot Password?"),
            ),
          ),
        ),
      ),
    );
  }
}
