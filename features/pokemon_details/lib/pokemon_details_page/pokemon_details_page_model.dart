import 'package:shared/data/pokemon_dao.dart';
import 'package:shared/entities/pokemon.dart';
import 'package:shared/mappers/pokemon_mapper.dart';

class PokemonDetailsPageModel {
  final PokemonDao _pokemonDao;

  PokemonDetailsPageModel(this._pokemonDao);

  Future<Pokemon?> getPokemonById(int id) async {
    final pokemonData = await _pokemonDao.getPokemonById(id);

    if (pokemonData == null) return null;

    return PokemonMapper.mapDataToEntity(pokemonData);
  }

  List<Pokemon> getAllPokemons() {
    final pokemonsData = _pokemonDao.getAllPokemons();

    return pokemonsData
        .map((data) => PokemonMapper.mapDataToEntity(data))
        .toList();
  }
}
