import 'package:flutter/material.dart';

abstract class Route {
  String get route;
  Widget parser(
    Uri deeplink,
    Widget Function({Object? arguments}) pageBuilder,
  );
}
