import 'package:flutter/material.dart';

import '../../utilities/color_manager.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final String hint;
  final String validateMessage;
  final FocusNode fNode;
  final Function? onComplete;

  const DefaultTextField({
    Key? key,
    required this.controller,
    required this.inputType,
    required this.label,
    required this.hint,
    required this.validateMessage,
    required this.fNode,
    this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: fNode,
        keyboardType: inputType,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hint,
          border: InputBorder.none,
        ),
        cursorColor: ColorManager.primary,
        validator: (value) {
          if (value!.isEmpty) {
            return validateMessage;
          }
          return null;
        },
        onEditingComplete: () {
          onComplete!();
        },
      ),
    );
  }
}