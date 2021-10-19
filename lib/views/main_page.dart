import 'package:apptestfh/constatnts/constants.dart';
import 'package:apptestfh/widgets/button.dart';
import 'package:flutter/material.dart';

class MainViewPage extends StatelessWidget {
  const MainViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Text(ConstantCall.firebaseAuth.currentUser!.email!),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: ButtonFH(
                press: () => ConstantCall.auth.signOutUser(),
                width: 245,
                hieght: 50,
                colorback: Colors.blueAccent,
                textColor: Colors.white,
                texttitle: "Sign Out",
              ),
            ),
          ],
        ),
      )),
    );
  }
}
