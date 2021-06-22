import 'package:domain/constants/pokemon_type.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/app/theme/palette.dart';

extension PokemonTypePresentationX on PokemonType {
  Color get color {
    switch (this) {
      case PokemonType.bug:
        return Palette.bugTypeColor;

      case PokemonType.dark:
        return Palette.darkTypeColor;

      case PokemonType.dragon:
        return Palette.dragonTypeColor;

      case PokemonType.electric:
        return Palette.electricTypeColor;

      case PokemonType.fairy:
        return Palette.fairyTypeColor;

      case PokemonType.fighting:
        return Palette.fightingTypeColor;

      case PokemonType.fire:
        return Palette.fireTypeColor;

      case PokemonType.flying:
        return Palette.flyingTypeColor;

      case PokemonType.ghost:
        return Palette.ghostTypeColor;

      case PokemonType.grass:
        return Palette.grassTypeColor;

      case PokemonType.ground:
        return Palette.groundTypeColor;

      case PokemonType.ice:
        return Palette.iceTypeColor;

      case PokemonType.normal:
        return Palette.normalTypeColor;

      case PokemonType.poison:
        return Palette.poisonTypeColor;

      case PokemonType.psychic:
        return Palette.psychicTypeColor;

      case PokemonType.rock:
        return Palette.rockTypeColor;

      case PokemonType.steel:
        return Palette.steelTypeColor;

      case PokemonType.water:
        return Palette.waterTypeColor;

      default:
        return Colors.black;
    }
  }
}
