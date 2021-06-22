import 'package:injectable/injectable.dart';
import 'package:data/api/requests/get_all_pokemon_request.dart';

import '../../api/api.dart';
import '../../model/pokemon_data.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonData>> getAllPokemons({int limit = 20, int offset});
}

@LazySingleton(as: PokemonRemoteDataSource)
class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final ApiClient _apiClient;

  PokemonRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<PokemonData>> getAllPokemons(
      {int limit = 20, int offset = 0}) async {
    final listResponse =
        await _apiClient.getAllPokemons(GetAllPokemonRequest());

    final pokemonList =
        listResponse.data.pokemon.map((item) => item.toPokemonData()).toList();

    return pokemonList;
  }
}
