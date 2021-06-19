import 'package:pokeapp/domain/core/result.dart';

import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Result<List<Pokemon>>> getAllPokemons();
}
