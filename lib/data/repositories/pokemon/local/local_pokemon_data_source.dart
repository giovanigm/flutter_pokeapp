import 'package:injectable/injectable.dart';
import 'package:pokeapp/data/db/pokemon_dao.dart';
import 'package:pokeapp/data/model/pokemon_data.dart';

abstract class LocalPokemonDataSource {
  Future<List<PokemonData>> getAllPokemons({int limit = 20, int offset});
  Future<void> insertAll(List<PokemonData> pokemons);
}

@LazySingleton(as: LocalPokemonDataSource)
class LocalPokemonDataSourceImpl implements LocalPokemonDataSource {
  final PokemonDao _dao;

  LocalPokemonDataSourceImpl(this._dao);

  @override
  Future<List<PokemonData>> getAllPokemons({int limit = 20, int offset}) =>
      _dao.getAllPokemons(limit, offset);

  @override
  Future<void> insertAll(List<PokemonData> pokemons) =>
      _dao.insertAll(pokemons);
}
