import 'package:data/data_sources/pokemon/pokemon_local_data_source.dart';
import 'package:data/data_sources/pokemon/pokemon_remote_data_source.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/core/result.dart';

@LazySingleton(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonLocalDataSource _localDataSource;
  final PokemonRemoteDataSource _remoteDataSource;

  PokemonRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Result<List<Pokemon>>> getAllPokemons() async {
    try {
      final databaseList = await _localDataSource.getAllPokemons();
      if (databaseList.isEmpty) {
        final pokemonList = await _remoteDataSource.getAllPokemons();

        _localDataSource.insertAll(pokemonList);

        final entities = pokemonList.map((data) => data.toEntity()).toList();

        return Result.success(value: entities);
      } else {
        final entities = databaseList.map((data) => data.toEntity()).toList();

        return Result.success(value: entities);
      }
    } catch (error) {
      return const Result.error();
    }
  }
}
