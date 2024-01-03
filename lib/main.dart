import 'package:flutter/material.dart';
import 'package:heyflutter_codding_challenge/core/constants/application_constant.dart';
import 'package:heyflutter_codding_challenge/core/theme/light/app_theme_light.dart';
import 'package:heyflutter_codding_challenge/features/onboarding/view/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationConstants.appName,
      theme: AppThemeLight.instance.theme,
      debugShowCheckedModeBanner: false,
      home: const OnboardingView(),
    );
  }
}
