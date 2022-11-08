import 'package:pokemon_api/pokemon_api.dart';

class PokemonResponseFixture {
  PokemonResponseFixture._();

  static PokemonListResponse get pokemonListResponse =>
      PokemonListResponse(Data([
        PokemonResponse(
            1, 1, 1, 1, Species("Species 1"), [Type(TypeName("bug"))]),
        PokemonResponse(
            2, 2, 2, 2, Species("Species 2"), [Type(TypeName("dragon"))]),
      ]));
}
