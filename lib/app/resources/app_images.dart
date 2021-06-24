import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class AppAssetImage extends AssetImage {
  const AppAssetImage(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  const AppImages._();

  static const pokeball = AppAssetImage('pokeball.svg');
  static const dots = AppAssetImage('dots.png');

  static Future<void> precacheAssets(BuildContext context) async {
    await Future.wait([
      precacheImage(dots, context),
      precacheImage(pokeball, context),
    ]);
  }
}
