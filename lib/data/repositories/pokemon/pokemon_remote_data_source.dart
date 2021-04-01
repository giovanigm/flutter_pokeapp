import 'package:injectable/injectable.dart';

import '../../../domain/constants/pokemon_type.dart';
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
    var listResponse =
        await _apiClient.getAllPokemons(limit: limit, offset: offset);

    var pokemonList =
        listResponse.results.map((item) => item.toPokemonData()).toList();

    for (var pokemon in pokemonList) {
      var infoResponse = await _apiClient.getPokemonInfo(pokemon.id);
      pokemon.baseExperience = infoResponse.baseExperience;
      pokemon.height = infoResponse.height;
      pokemon.weight = infoResponse.weight;

      final types = infoResponse.types;

      pokemon.primaryType = PokemonTypeX.fromValue(types.first.type.name);

      if (types.length >= 2) {
        pokemon.secondaryType = PokemonTypeX.fromValue(types[1].type.name);
      }
    }

    return pokemonList;
  }
}
