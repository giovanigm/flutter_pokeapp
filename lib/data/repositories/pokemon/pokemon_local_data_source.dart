import 'package:injectable/injectable.dart';

import '../../db/pokemon_dao.dart';
import '../../model/pokemon_data.dart';

abstract class PokemonLocalDataSource {
  Future<List<PokemonData>> getAllPokemons();
  Future<void> insertAll(List<PokemonData> pokemons);
}

@LazySingleton(as: PokemonLocalDataSource)
class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final PokemonDao _dao;

  PokemonLocalDataSourceImpl(this._dao);

  @override
  Future<List<PokemonData>> getAllPokemons() => _dao.getAllPokemons();

  @override
  Future<void> insertAll(List<PokemonData> pokemons) =>
      _dao.insertAll(pokemons);
}
