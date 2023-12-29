import 'package:flutter/material.dart';
import 'package:heyflutter_codding_challenge/core/extensions/context_extension.dart';
import 'package:heyflutter_codding_challenge/features/home/view/home_view.dart';
import 'package:heyflutter_codding_challenge/product/component/custom_button.dart';
import 'package:heyflutter_codding_challenge/product/component/rich_text.dart';
import 'package:heyflutter_codding_challenge/product/enums/assets_enum.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildTopInformation(context),
          const Spacer(),
          buildImage,
        ],
      ),
    );
  }

  Expanded buildTopInformation(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: context.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildLogo,
            buildInformationText(context),
            buildButton(context),
          ],
        ),
      ),
    );
  }

  Expanded get buildLogo {
    return Expanded(
      flex: 2,
      child: Image.asset(
        AssetsEnum.logo.toPng,
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Expanded buildInformationText(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            textOne: Text(
              "Looking ",
              style: context.textTheme.displaySmall?.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            textTwo: Text(
              "for an",
              style: context.textTheme.displaySmall?.copyWith(
                color: context.colors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "elegant house this \nis the place",
            style: context.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: context.width * .7,
            child: Text(
              'Welcome friends, are you looking for us?\nCongratulations you have found us',
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomButton buildButton(BuildContext context) {
    return CustomButton(
      text: "Next",
      icon: Icons.arrow_right_alt,
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
        );
      },
    );
  }

  Image get buildImage {
    return Image.asset(
      AssetsEnum.onboardingImage.toPng,
    );
  }
}
