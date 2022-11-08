import 'package:flutter/material.dart' hide Route;

import '../core/route.dart';

class SplashRoute extends Route {
  @override
  String get route => "splash";

  @override
  Widget parser(
    Uri deeplink,
    Widget Function({Object? arguments}) pageBuilder,
  ) {
    return pageBuilder();
  }

  String build() => route;
}
