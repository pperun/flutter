import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final String? Function(String?)? validator;

  const DecoratedTextField(
      {super.key, required this.textEditingController, this.hintText, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      cursorColor: Colors.black,
      validator: validator,
    );
  }
}
