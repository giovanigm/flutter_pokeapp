import 'package:data/model/pokemon_data.dart';
import 'package:domain/constants/pokemon_type.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "Pokemons")
class PokemonDTO {
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

  PokemonDTO({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.primaryType,
    required this.secondaryType,
  });

  PokemonData toData() => PokemonData(
        id: id,
        name: name,
        imageUrl: imageUrl,
        baseExperience: baseExperience,
        height: height,
        weight: weight,
        primaryType: primaryType,
        secondaryType: secondaryType,
      );

  factory PokemonDTO.fromData(PokemonData data) => PokemonDTO(
        id: data.id,
        name: data.name,
        imageUrl: data.imageUrl,
        baseExperience: data.baseExperience,
        height: data.height,
        weight: data.weight,
        primaryType: data.primaryType,
        secondaryType: data.secondaryType,
      );
}
