import 'package:injectable/injectable.dart';
import 'package:pokeapp/data/repositories/pokemon/local/local_pokemon_data_source.dart';
import 'package:pokeapp/data/repositories/pokemon/remote/remote_pokemon_data_source.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

@LazySingleton(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  final LocalPokemonDataSource _localDataSource;
  final RemotePokemonDataSource _remoteDataSource;

  PokemonRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<List<Pokemon>> getAllPokemons({int lastId}) async {
    int offset = lastId ?? 0;
    final databaseList = await _localDataSource.getAllPokemons(offset: offset);
    if (databaseList.isEmpty) {
      final pokemonList =
          await _remoteDataSource.getAllPokemons(offset: offset);

      await _localDataSource.insertAll(pokemonList);

      return pokemonList.map((data) => data.toEntity()).toList();
    } else {
      return databaseList.map((data) => data.toEntity()).toList();
    }
  }
}
