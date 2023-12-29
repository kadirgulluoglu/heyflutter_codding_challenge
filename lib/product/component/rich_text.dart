import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRichText extends RichText {
  final Text textOne;
  final Text textTwo;

  CustomRichText({
    super.key,
    required this.textOne,
    required this.textTwo,
  }) : super(
          text: TextSpan(
            children: [
              TextSpan(
                text: textOne.data,
                style: textOne.style,
              ),
              TextSpan(
                text: textTwo.data,
                style: textTwo.style,
              ),
            ],
          ),
        );
}
