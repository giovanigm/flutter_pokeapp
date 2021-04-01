import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getAllPokemons({int? lastId});
}
