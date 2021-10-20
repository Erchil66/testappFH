import 'package:flutter/material.dart';

class TextFieldFH extends StatelessWidget {
  final TextEditingController? editingController;
  final String? Function(String?)? validator;
  final TextInputType? typeKeyboard;
  final bool? obsecure;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmit;
  final String? hinttext;
  final double? width;
  final double? hieght;

  const TextFieldFH(
      {Key? key,
      this.editingController,
      this.validator,
      this.typeKeyboard,
      this.obsecure,
      this.onChanged,
      this.onSubmit,
      this.hinttext,
      this.width,
      this.hieght})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hieght ?? 60,
      width: width ?? 347,
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        autofocus: false,
        autocorrect: false,
        controller: editingController,
        onChanged: onChanged,
        onSaved: onSubmit,
        keyboardType: typeKeyboard,
        obscureText: obsecure ?? false,
        validator: validator,
        decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hinttext!,
            hintStyle: const TextStyle(color: Colors.black)),
      ),
    );
  }
}
