import 'package:flutter/material.dart';

typedef VoidCallback = void Function(String);

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent(
      {super.key,
      required this.keyboardType,
      required this.decoration,
      required this.controller,
      required this.data});
  final TextInputType keyboardType;
  final InputDecoration decoration;
  final TextEditingController controller;
  final VoidCallback data;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length));
      },
      onChanged: (val) {
        data(val);
        controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length));
      },
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: decoration,
    );
  }
}
