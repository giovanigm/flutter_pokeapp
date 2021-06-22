import 'package:domain/constants/pokemon_type.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "Pokemons")
class PokemonData {
  @primaryKey
  final int id;

  final String name;

  @ColumnInfo(name: "image_url")
  final String imageUrl;

  @ColumnInfo(name: "base_experience")
  int baseExperience;

  int height;

  int weight;

  @ColumnInfo(name: "primary_type")
  PokemonType primaryType;

  @ColumnInfo(name: "secondary_type")
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
