import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final FloatingLabelBehavior floatingLabelBehavior;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        floatingLabelBehavior: floatingLabelBehavior,
        label: Text(label),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
