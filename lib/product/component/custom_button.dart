import 'package:flutter/material.dart';
import 'package:heyflutter_codding_challenge/core/extensions/context_extension.dart';

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback? onPressed;

  const CustomButton(
      {super.key, this.icon, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.primary,
        foregroundColor: context.colors.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: context.containerRadius,
        ),
      ),
      onPressed: onPressed,
      child: icon == null
          ? Text(text)
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(text),
                const SizedBox(width: 8),
                Icon(icon),
              ],
            ),
    );
  }
}
