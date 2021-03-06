import 'package:injectable/injectable.dart';
import 'package:pokeapp/data/api/api.dart';
import 'package:pokeapp/data/model/pokemon_data.dart';

abstract class RemotePokemonDataSource {
  Future<List<PokemonData>> getAllPokemons({int limit = 20, int offset});
}

@LazySingleton(as: RemotePokemonDataSource)
class RemotePokemonDataSourceImpl implements RemotePokemonDataSource {
  final ApiClient _apiClient;

  RemotePokemonDataSourceImpl(this._apiClient);

  @override
  Future<List<PokemonData>> getAllPokemons({int limit = 20, int offset}) async {
    var listResponse =
        await _apiClient.getAllPokemons(limit: limit, offset: offset);

    var pokemonList =
        listResponse.results.map((item) => item.toPokemonData()).toList();

    for (var pokemon in pokemonList) {
      var infoResponse = await _apiClient.getPokemonInfo(pokemon.id);
      pokemon.baseExperience = infoResponse.baseExperience;
      pokemon.height = infoResponse.height;
      pokemon.weight = infoResponse.weight;
      pokemon.types =
          infoResponse.types.map((data) => data.type.name).join(",");
    }

    return pokemonList;
  }
}
