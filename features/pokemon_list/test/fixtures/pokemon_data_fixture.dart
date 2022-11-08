import 'package:shared/data/pokemon_data.dart';
import 'package:shared/entities/pokemon_type.dart';

class PokemonDataFixture {
  PokemonDataFixture._();

  static List<PokemonData> get pokemons => [
        const PokemonData(
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
        const PokemonData(
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
