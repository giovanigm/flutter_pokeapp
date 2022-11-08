import 'package:pokemon_api/pokemon_api.dart';
import 'package:shared/data/pokemon_dao.dart';
import 'package:shared/entities/pokemon.dart';
import 'package:shared/mappers/pokemon_mapper.dart';

class PokemonListPageModel {
  final PokemonApi _pokemonApi;
  final PokemonDao _pokemonDao;

  PokemonListPageModel(
    this._pokemonApi,
    this._pokemonDao,
  );

  Future<List<Pokemon>> loadPokemons() async {
    final cachedPokemons = _pokemonDao.getAllPokemons();
    if (cachedPokemons.isNotEmpty) {
      return cachedPokemons
          .map((data) => PokemonMapper.mapDataToEntity(data))
          .toList();
    }

    final pokemonsResponse =
        await _pokemonApi.getAllPokemons(GetAllPokemonRequest());

    final pokemons = pokemonsResponse.data.pokemon
        .map((response) => PokemonMapper.mapResponseToEntity(response))
        .toList();

    await _pokemonDao.saveAll(pokemons
        .map((entity) => PokemonMapper.mapEntityToData(entity))
        .toList());

    return pokemons;
  }
}
