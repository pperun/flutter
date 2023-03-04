import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String text)? onSubmitted;

  const InputTextField(
      {super.key, required this.controller, required this.onSubmitted});

  @override
  State<StatefulWidget> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey.shade300,
          hintText: 'Нове завдання...',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
