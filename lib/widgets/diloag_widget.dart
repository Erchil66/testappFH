import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/constatnts/validator.dart';
import 'package:apptestfh/widgets/button.dart';
import 'package:apptestfh/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWidgetx {
  static loading() {
    Get.dialog(
      Center(
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: const Center(
              child: CircularProgressIndicator(
            color: Colors.blueAccent,
          )),
        ),
      ),
      barrierColor: Colors.grey.withOpacity(0.3),
      barrierDismissible: true,
    );
  }

  static dialogForgotPass(TextEditingController? forgotpass) {
    Get.defaultDialog(
      barrierDismissible: true,
      title: "Forgot Password",
      titlePadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.all(15),
      content: SizedBox(
        height: 100,
        width: 300,
        child: Center(
          child: TextFieldFH(
            hinttext: "Email",
            editingController: forgotpass!,
            onChanged: (onchanged) {},
            onSubmit: (onsubmit) {},
            width: 250,
            hieght: 50,
            validator: (value) =>
                ValidatorString.email(forgotpass.text = value!),
            typeKeyboard: TextInputType.emailAddress,
          ),
        ),
      ),
      confirm: ButtonFH(
        press: () =>
            ConstantCall.auth.forgotPasswordUser(email: forgotpass.value.text),
        width: 245,
        hieght: 50,
        colorback: Colors.blueAccent,
        textColor: Colors.white,
        texttitle: "Send Email",
      ),
    );
  }
}
