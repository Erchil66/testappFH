import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/constatnts/validator.dart';
import 'package:apptestfh/controllers/mainhome_controller.dart';
import 'package:apptestfh/firestore_service/cloud_functions.dart';
import 'package:apptestfh/route/route_string.dart';
import 'package:apptestfh/storage/storage.dart';
import 'package:apptestfh/widgets/button.dart';
import 'package:apptestfh/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewPage extends StatelessWidget {
  MainViewPage({Key? key}) : super(key: key);
  final mainhomeController = Get.put(MainHomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => mainhomeController.listUser.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: TextFieldFH(
                        hinttext: mainhomeController.emailString.value,
                        editingController: mainhomeController.email,
                        onChanged: (onchanged) {},
                        onSubmit: (onsubmit) {},
                        width: 250,
                        hieght: 50,
                        validator: (value) {},
                        typeKeyboard: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFieldFH(
                        hinttext: mainhomeController.firstNameString.value,
                        editingController: mainhomeController.firstName,
                        onChanged: (onchanged) {},
                        onSubmit: (onsubmit) {},
                        width: 250,
                        hieght: 50,
                        validator: (value) {},
                        typeKeyboard: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFieldFH(
                        hinttext: mainhomeController.lastNameString.value,
                        editingController: mainhomeController.lastName,
                        onChanged: (onchanged) {},
                        onSubmit: (onsubmit) {},
                        width: 250,
                        hieght: 50,
                        validator: (value) {},
                        typeKeyboard: TextInputType.text,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextFieldFH(
                        hinttext: mainhomeController.phoneString.value,
                        editingController: mainhomeController.phone,
                        onChanged: (onchanged) {},
                        onSubmit: (onsubmit) {},
                        width: 250,
                        hieght: 50,
                        validator: (value) {},
                        typeKeyboard: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: ButtonFH(
                        press: () =>
                            mainhomeController.updateUserDetailWithEmailAlso(),
                        width: 245,
                        hieght: 50,
                        colorback: Colors.blueAccent,
                        textColor: Colors.white,
                        texttitle: "Update",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ButtonFH(
                        press: () => mainhomeController.signOutNowOkay(),
                        width: 245,
                        hieght: 50,
                        colorback: Colors.blueAccent,
                        textColor: Colors.white,
                        texttitle: "Sign Out",
                      ),
                    ),
                  ],
                ),
              ),
      )),
    );
  }
}
