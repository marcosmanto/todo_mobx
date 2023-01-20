import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      this.prefix,
      this.suffix,
      this.obscure = false,
      this.textInputType = TextInputType.text,
      required this.onChanged,
      this.onSubmit,
      this.enabled = true,
      required this.controller,
      this.defaultValue});

  final TextEditingController controller;
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final Function()? onSubmit;
  final bool enabled;
  final String? defaultValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(32),
      ),
      padding: EdgeInsets.only(
          left: prefix != null ? 0 : 16, right: suffix != null ? 0 : 28),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        onEditingComplete: onSubmit,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.withAlpha(200)),
          alignLabelWithHint: true,
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
