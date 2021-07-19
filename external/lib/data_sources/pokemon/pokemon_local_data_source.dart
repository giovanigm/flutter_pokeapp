import 'package:data/data_sources/pokemon/pokemon_local_data_source.dart';
import 'package:data/model/pokemon_data.dart';
import 'package:external/db/pokemon_dao.dart';
import 'package:external/model/pokemon_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PokemonLocalDataSource)
class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final PokemonDao _dao;

  PokemonLocalDataSourceImpl(this._dao);

  @override
  Future<List<PokemonData>> getAllPokemons() async {
    final pokemonDTOs = await _dao.getAllPokemons();

    final pokemonData = pokemonDTOs.map((e) => e.toData()).toList();

    return pokemonData;
  }

  @override
  Future<void> insertAll(List<PokemonData> pokemons) {
    final pokemonDTOs =
        pokemons.map((data) => PokemonDTO.fromData(data)).toList();

    return _dao.insertAll(pokemonDTOs);
  }
}
