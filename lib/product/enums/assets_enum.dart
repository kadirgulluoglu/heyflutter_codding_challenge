enum AssetsEnum {
  onboardingImage('onboarding_image'),
  logo('logo');

  String get toPng => 'assets/images/$name.png';

  String get toJpg => 'assets/images/$name.jpg';

  String get toGif => 'assets/gif/$name.gif';

  String get toJson => 'assets/images/json/$name.json';

  final String name;

  const AssetsEnum(this.name);
}
