import 'package:data/data_sources/pokemon/pokemon_remote_data_source.dart';
import 'package:data/model/pokemon_data.dart';
import 'package:external/api/api.dart';
import 'package:external/api/requests/get_all_pokemon_request.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PokemonRemoteDataSource)
class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final ApiClient _apiClient;

  PokemonRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<PokemonData>> getAllPokemons() async {
    final listResponse =
        await _apiClient.getAllPokemons(GetAllPokemonRequest());

    final pokemonList = listResponse.data.pokemon
        .map((item) => item.toPokemonDTO().toData())
        .toList();

    return pokemonList;
  }
}
