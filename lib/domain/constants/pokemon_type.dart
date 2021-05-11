import 'package:flutter/material.dart' show Color, Colors;

import '../../common/string_extensions.dart';

enum PokemonType {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water,
  undefined,
}

extension PokemonTypeX on PokemonType {
  Color get color {
    switch (this) {
      case PokemonType.bug:
        return const Color(0xFF3c9950);

      case PokemonType.dark:
        return const Color(0xFF595978);

      case PokemonType.dragon:
        return const Color(0xFF62cad9);

      case PokemonType.electric:
        return const Color(0xFFffd86f);

      case PokemonType.fairy:
        return const Color(0xFFe91368);

      case PokemonType.fighting:
        return const Color(0xFFef6239);

      case PokemonType.fire:
        return const Color(0xFFfb6c6c);

      case PokemonType.flying:
        return const Color(0xFF94b2c7);

      case PokemonType.ghost:
        return const Color(0xFF906791);

      case PokemonType.grass:
        return const Color(0xFF48d0b0);

      case PokemonType.ground:
        return const Color(0xFF6e491f);

      case PokemonType.ice:
        return const Color(0xFF86DCFF);

      case PokemonType.normal:
        return const Color(0xFFca98a6);

      case PokemonType.poison:
        return const Color(0xFF9b69da);

      case PokemonType.psychic:
        return const Color(0xFFf71d92);

      case PokemonType.rock:
        return const Color(0xFF8b3e22);

      case PokemonType.steel:
        return const Color(0xFF43bd94);

      case PokemonType.water:
        return const Color(0xFF0085FF);

      default:
        return Colors.black;
    }
  }

  String get name =>
      toString().substring(toString().indexOf('.') + 1).capitalize();

  String get value => name.toLowerCase();

  static PokemonType fromValue(String value) {
    for (final PokemonType type in PokemonType.values) {
      if (value == type.value) return type;
    }
    return PokemonType.undefined;
  }
}
