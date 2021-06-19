import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../constants/pokemon_type.dart';

part 'pokemon.freezed.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required String imageUrl,
    required PokemonType primaryType,
    PokemonType? secondaryType,
    required int baseExperience,
    required int height,
    required int weight,
  }) = _Pokemon;
}
