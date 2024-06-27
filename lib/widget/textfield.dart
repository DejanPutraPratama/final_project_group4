import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String label;
  final bool isPassword;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.label,
      this.controller,
      this.isPassword = false,
      this.obscureText = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          label: Text(label),
          labelStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(10)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(10)
          ),
          suffixIcon: isPassword ? suffixIcon : null,
      ),
    );
  }
}
