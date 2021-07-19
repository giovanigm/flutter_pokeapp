import 'package:data/model/pokemon_data.dart';

abstract class PokemonLocalDataSource {
  Future<List<PokemonData>> getAllPokemons();
  Future<void> insertAll(List<PokemonData> pokemons);
}
