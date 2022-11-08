import 'package:pokemon_api/pokemon_api.dart';
import 'package:shared/data/pokemon_data.dart';
import 'package:shared/entities/pokemon.dart';

import '../core/string_extensions.dart';
import '../entities/pokemon_type.dart';

class PokemonMapper {
  PokemonMapper._();

  static Pokemon mapResponseToEntity(PokemonResponse response) {
    PokemonType? secondaryType;
    if (response.types.length == 2) {
      secondaryType = PokemonTypeX.fromValue(response.types[1].type.name);
    }

    return Pokemon(
      id: response.id,
      name: response.species.name.capitalize(),
      imageUrl:
          "https://assets.pokemon.com/assets/cms2/img/pokedex/full/${response.id.toString().padLeft(3, '0')}.png",
      primaryType: PokemonTypeX.fromValue(response.types[0].type.name),
      secondaryType: secondaryType,
      baseExperience: response.baseExperience,
      height: response.height,
      weight: response.weight,
    );
  }

  static PokemonData mapEntityToData(Pokemon entity) => PokemonData(
        id: entity.id,
        name: entity.name,
        imageUrl: entity.imageUrl,
        primaryType: entity.primaryType,
        secondaryType: entity.secondaryType,
        baseExperience: entity.baseExperience,
        height: entity.height,
        weight: entity.weight,
      );

  static Pokemon mapDataToEntity(PokemonData data) => Pokemon(
        id: data.id,
        name: data.name,
        imageUrl: data.imageUrl,
        primaryType: data.primaryType,
        secondaryType: data.secondaryType,
        baseExperience: data.baseExperience,
        height: data.height,
        weight: data.weight,
      );
}
