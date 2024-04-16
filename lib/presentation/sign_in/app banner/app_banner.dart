class AppBanner {
  final int id;
  final String title;
  final String description;
  final String img;

  AppBanner({
    required this.id,
    required this.title,
    required this.description,
    required this.img,
  });
}

List<AppBanner> appBannerList = [
  AppBanner(
    id: 1,
    title: 'Configure with ease',
    img: 'assets/images/config_with_ease.png',
    description:
        'Take control of your vehicle configuration to suit your needs in just a few clicks.',
  ),
  AppBanner(
    id: 2,
    title: 'Keep Connected',
    img: 'assets/images/keep_connected.png',
    description: 'Monitor your vehicle conditions, status, and history – all from the comfort of your phone.',
  ),
  AppBanner(
    id: 3,
    title: 'Drive Smarter',
    img: 'assets/images/drive_smarter.png',
    description:
        'Get the most out of your ride with the route trip estimator to reach your destination faster and more efficiently.',
  ),
];
