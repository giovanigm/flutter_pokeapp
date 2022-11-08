import 'package:flutter/material.dart' hide Route;

import '../core/route.dart';

class PokemonListRoute extends Route {
  @override
  String get route => "pokemon_list";

  @override
  Widget parser(
    Uri deeplink,
    Widget Function({Object? arguments}) pageBuilder,
  ) {
    return pageBuilder();
  }

  String build() => route;
}
