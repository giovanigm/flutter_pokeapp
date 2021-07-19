import 'package:domain/constants/pokemon_type.dart';
import 'package:domain/entities/pokemon.dart';

class PokemonData {
  final int id;

  final String name;

  final String imageUrl;

  int baseExperience;

  int height;

  int weight;

  PokemonType primaryType;

  PokemonType? secondaryType;

  PokemonData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.primaryType,
    required this.secondaryType,
  });

  Pokemon toEntity() => Pokemon(
        id: id,
        name: name,
        imageUrl: imageUrl,
        baseExperience: baseExperience,
        height: height,
        weight: weight,
        primaryType: primaryType,
        secondaryType: secondaryType,
      );

  factory PokemonData.fromEntity(Pokemon entity) => PokemonData(
        id: entity.id,
        name: entity.name,
        imageUrl: entity.imageUrl,
        baseExperience: entity.baseExperience,
        height: entity.height,
        weight: entity.weight,
        primaryType: entity.primaryType,
        secondaryType: entity.secondaryType,
      );
}
