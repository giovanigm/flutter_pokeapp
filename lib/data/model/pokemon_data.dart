import 'package:floor/floor.dart';
import 'package:pokeapp/domain/constants/pokemon_type.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

@Entity(tableName: "Pokemons")
class PokemonData {
  @primaryKey
  final int id;

  final String name;

  final String imageUrl;

  int baseExperience;
  int height;
  int weight;
  String types;

  PokemonData(
      {this.id,
      this.name,
      this.imageUrl,
      this.baseExperience,
      this.height,
      this.weight,
      this.types});

  Pokemon toEntity() => Pokemon(
      id: id,
      name: name,
      imageUrl: imageUrl,
      baseExperience: baseExperience,
      height: height,
      weight: weight,
      types: types
          .split(",")
          .map((type) => PokemonTypeX.fromValue(type))
          .toList());

  factory PokemonData.fromEntity(Pokemon entity) => PokemonData(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      baseExperience: entity.baseExperience,
      height: entity.height,
      weight: entity.weight,
      types: entity.types.map((type) => type.value).join(","));
}
