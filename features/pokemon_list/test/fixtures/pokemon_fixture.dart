import 'package:shared/entities/pokemon.dart';
import 'package:shared/entities/pokemon_type.dart';

class PokemonFixture {
  PokemonFixture._();

  static List<Pokemon> get pokemon => [
        Pokemon(
          id: 1,
          name: "Species 1",
          imageUrl:
              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
          primaryType: PokemonType.bug,
          secondaryType: null,
          baseExperience: 1,
          height: 1,
          weight: 1,
        ),
        Pokemon(
          id: 2,
          name: "Species 2",
          imageUrl:
              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png",
          primaryType: PokemonType.dragon,
          secondaryType: null,
          baseExperience: 2,
          height: 2,
          weight: 2,
        ),
      ];
}
