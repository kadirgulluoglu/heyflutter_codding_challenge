import 'package:flutter/material.dart';
import 'package:heyflutter_codding_challenge/core/extensions/context_extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.prefixIcon,
      this.hintText,
      this.suffixIcon});
  final TextEditingController controller;
  final IconData? prefixIcon;
  final String? hintText;
  final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        fillColor: context.colors.onPrimary,
        filled: true,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 25, top: 15, bottom: 15),
                child: Icon(
                  suffixIcon,
                  color: Colors.grey,
                ),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
      ),
    );
  }
}
