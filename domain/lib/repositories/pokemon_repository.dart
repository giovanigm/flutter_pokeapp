import '../core/result.dart';
import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Result<List<Pokemon>>> getAllPokemons();
}
