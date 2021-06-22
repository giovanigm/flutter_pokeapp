import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/pokemon.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/core/result.dart';

import 'pokemon_local_data_source.dart';
import 'pokemon_remote_data_source.dart';

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
      switch (error.runtimeType) {
        case DioError:
          // final res = (error as DioError).response;
          break;
        default:
      }
      return const Result.error();
    }
  }
}
