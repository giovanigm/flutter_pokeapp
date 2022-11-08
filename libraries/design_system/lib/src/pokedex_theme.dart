import 'package:flutter/material.dart';

import 'pokedex_typography.dart';

class PokedexTheme {
  PokedexTheme._();

  static ThemeData get lightTheme {
    return ThemeData.from(
      useMaterial3: false,
      colorScheme: const ColorScheme.light(),
      textTheme: const TextTheme(
        headline1: PokedexTypography.headline1,
        headline2: PokedexTypography.headline2,
        headline3: PokedexTypography.headline3,
        headline4: PokedexTypography.headline4,
        headline5: PokedexTypography.headline5,
        headline6: PokedexTypography.headline6,
        subtitle1: PokedexTypography.subtitle1,
        subtitle2: PokedexTypography.subtitle2,
        bodyText1: PokedexTypography.body1,
        bodyText2: PokedexTypography.body2,
        button: PokedexTypography.button,
        caption: PokedexTypography.caption,
        overline: PokedexTypography.overline,
      ),
    );
  }
}
