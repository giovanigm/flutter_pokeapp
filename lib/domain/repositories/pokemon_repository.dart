import 'package:pokeapp/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getAllPokemons({int lastId});
}
