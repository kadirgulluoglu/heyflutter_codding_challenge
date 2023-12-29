import 'dart:ui';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get shortestSide => mediaQuery.size.shortestSide;

  Orientation get orientation => mediaQuery.orientation;

  double get lowValue => height * 0.01;

  double get normalValue => height * 0.02;

  double get mediumValue => height * 0.05;

  double get highValue => height * 0.1;

  double get productImageHeight => height * 0.25;

  double get productImageWidth => width * 0.45;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);

  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);

  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);

  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  EdgeInsets get paddingButton => const EdgeInsets.all(20.0);

  EdgeInsets get pagePadding => EdgeInsets.only(
        left: normalValue,
        right: normalValue,
        top: normalValue,
      );

  EdgeInsets get pagePaddingTopLeftRight =>
      const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0);

  EdgeInsets get bottomSheetPadding => mediaQuery.viewInsets + paddingNormal;
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingLowTop => EdgeInsets.only(top: lowValue);

  EdgeInsets get paddingLowRight => EdgeInsets.only(right: lowValue);
  EdgeInsets get paddingNormalRight => EdgeInsets.only(right: normalValue);

  EdgeInsets get paddingNormalTop => EdgeInsets.only(top: normalValue);

  EdgeInsets get paddingMediumTop => EdgeInsets.only(top: mediumValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);

  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);

  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);

  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);

  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);

  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);

  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get paddingLowHorizontalAndVertical =>
      EdgeInsets.symmetric(horizontal: lowValue, vertical: lowValue);

  EdgeInsets get paddingNormalHorizontalAndVertical =>
      EdgeInsets.symmetric(horizontal: normalValue, vertical: normalValue);

  EdgeInsets get paddingHighVerticalMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue, vertical: highValue);

  EdgeInsets get paddingMediumHorizontalAndVertical =>
      EdgeInsets.symmetric(horizontal: mediumValue, vertical: mediumValue);
}

extension BlurExtension on BuildContext {
  ImageFilter get imageFilter => ImageFilter.blur(sigmaX: 16, sigmaY: 16);

  ImageFilter get lowFilter => ImageFilter.blur(sigmaX: 6, sigmaY: 6);

  ImageFilter get filter => ImageFilter.blur(sigmaX: 3, sigmaY: 3);
}

extension RadiusExtension on BuildContext {
  BorderRadius get containerRadius => BorderRadius.circular(10);

  BorderRadius get radiusTopLeftTopRight30 => const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      );
}
