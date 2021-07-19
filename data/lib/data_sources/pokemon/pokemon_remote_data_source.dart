import 'package:data/model/pokemon_data.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonData>> getAllPokemons();
}
