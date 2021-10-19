import 'package:flutter/material.dart';

class ButtonFH extends StatelessWidget {
  final double? width;
  final double? hieght;
  final Color? colorback;
  final String? texttitle;
  final Color? textColor;
  final Function()? press;

  const ButtonFH(
      {Key? key,
      this.width,
      this.hieght,
      this.colorback,
      this.texttitle,
      this.textColor,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hieght ?? 60,
      width: width ?? 375,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: colorback,
            elevation: 2,
            shadowColor: colorback!.withOpacity(0.3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: press,
        child: Center(
          child: Text(
            texttitle!,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
