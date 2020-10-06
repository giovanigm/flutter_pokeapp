// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data/api/api.dart';
import 'data/db/database.dart';
import 'data/di/data_module.dart';
import 'domain/usecases/get_all_pokemons.dart';
import 'data/repositories/pokemon/local/local_pokemon_data_source.dart';
import 'data/db/pokemon_dao.dart';
import 'app/list/pokemon_list_view_model.dart';
import 'domain/repositories/pokemon_repository.dart';
import 'data/repositories/pokemon/pokemon_repository_impl.dart';
import 'data/repositories/pokemon/remote/remote_pokemon_data_source.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final databaseModule = _$DatabaseModule();
  gh.lazySingleton<ApiClient>(() => databaseModule.apiClient);
  final appDatabase = await databaseModule.database;
  gh.lazySingleton<AppDatabase>(() => appDatabase);
  gh.lazySingleton<Dio>(() => databaseModule.dio);
  gh.lazySingleton<PokemonDao>(() => databaseModule.pokemonDao);
  gh.lazySingleton<RemotePokemonDataSource>(
      () => RemotePokemonDataSourceImpl(get<ApiClient>()));
  gh.lazySingleton<LocalPokemonDataSource>(
      () => LocalPokemonDataSourceImpl(get<PokemonDao>()));
  gh.lazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(
      get<LocalPokemonDataSource>(), get<RemotePokemonDataSource>()));
  gh.factory<GetAllPokemons>(() => GetAllPokemons(get<PokemonRepository>()));

  // Eager singletons must be registered in the right order
  gh.singleton<PokemonListCubit>(PokemonListCubit(get<GetAllPokemons>()));
  return get;
}

class _$DatabaseModule extends DatabaseModule {}
