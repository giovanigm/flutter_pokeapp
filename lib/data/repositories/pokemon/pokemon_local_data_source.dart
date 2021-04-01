import 'package:injectable/injectable.dart';

import '../../db/pokemon_dao.dart';
import '../../model/pokemon_data.dart';

abstract class PokemonLocalDataSource {
  Future<List<PokemonData>> getAllPokemons({int limit = 20, int offset = 0});
  Future<void> insertAll(List<PokemonData> pokemons);
}

@LazySingleton(as: PokemonLocalDataSource)
class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final PokemonDao _dao;

  PokemonLocalDataSourceImpl(this._dao);

  @override
  Future<List<PokemonData>> getAllPokemons({int limit = 20, int offset = 0}) =>
      _dao.getAllPokemons(limit, offset);

  @override
  Future<void> insertAll(List<PokemonData> pokemons) =>
      _dao.insertAll(pokemons);
}
