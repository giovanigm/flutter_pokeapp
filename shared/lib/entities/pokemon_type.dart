import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared/core/string_extensions.dart';

part 'pokemon_type.g.dart';

@HiveType(typeId: 1)
enum PokemonType {
  @HiveField(0)
  bug,
  @HiveField(1)
  dark,
  @HiveField(2)
  dragon,
  @HiveField(3)
  electric,
  @HiveField(4)
  fairy,
  @HiveField(5)
  fighting,
  @HiveField(6)
  fire,
  @HiveField(7)
  flying,
  @HiveField(8)
  ghost,
  @HiveField(9)
  grass,
  @HiveField(10)
  ground,
  @HiveField(11)
  ice,
  @HiveField(12)
  normal,
  @HiveField(13)
  poison,
  @HiveField(14)
  psychic,
  @HiveField(15)
  rock,
  @HiveField(16)
  steel,
  @HiveField(17)
  water,
  @HiveField(18)
  undefined,
}

extension PokemonTypeX on PokemonType {
  String get name =>
      toString().substring(toString().indexOf('.') + 1).capitalize();

  String get value => name.toLowerCase();

  static PokemonType fromValue(String value) {
    for (final PokemonType type in PokemonType.values) {
      if (value == type.value) return type;
    }
    return PokemonType.undefined;
  }

  Color get color {
    switch (this) {
      case PokemonType.bug:
        return PokedexPalette.bugTypeColor;

      case PokemonType.dark:
        return PokedexPalette.darkTypeColor;

      case PokemonType.dragon:
        return PokedexPalette.dragonTypeColor;

      case PokemonType.electric:
        return PokedexPalette.electricTypeColor;

      case PokemonType.fairy:
        return PokedexPalette.fairyTypeColor;

      case PokemonType.fighting:
        return PokedexPalette.fightingTypeColor;

      case PokemonType.fire:
        return PokedexPalette.fireTypeColor;

      case PokemonType.flying:
        return PokedexPalette.flyingTypeColor;

      case PokemonType.ghost:
        return PokedexPalette.ghostTypeColor;

      case PokemonType.grass:
        return PokedexPalette.grassTypeColor;

      case PokemonType.ground:
        return PokedexPalette.groundTypeColor;

      case PokemonType.ice:
        return PokedexPalette.iceTypeColor;

      case PokemonType.normal:
        return PokedexPalette.normalTypeColor;

      case PokemonType.poison:
        return PokedexPalette.poisonTypeColor;

      case PokemonType.psychic:
        return PokedexPalette.psychicTypeColor;

      case PokemonType.rock:
        return PokedexPalette.rockTypeColor;

      case PokemonType.steel:
        return PokedexPalette.steelTypeColor;

      case PokemonType.water:
        return PokedexPalette.waterTypeColor;

      default:
        return Colors.black;
    }
  }
}
