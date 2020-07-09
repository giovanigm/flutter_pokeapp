// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:pokeapp/data/di/data_module.dart';
import 'package:pokeapp/data/api/api.dart';
import 'package:pokeapp/data/db/database.dart';
import 'package:dio/dio.dart';
import 'package:pokeapp/data/db/pokemon_dao.dart';
import 'package:pokeapp/data/repositories/pokemon/remote/remote_pokemon_data_source.dart';
import 'package:pokeapp/data/repositories/pokemon/local/local_pokemon_data_source.dart';
import 'package:pokeapp/data/repositories/pokemon/pokemon_repository_impl.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';
import 'package:pokeapp/domain/usecases/get_all_pokemons.dart';
import 'package:pokeapp/app/list/pokemon_list_view_model.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final databaseModule = _$DatabaseModule();
  g.registerLazySingleton<ApiClient>(() => databaseModule.apiClient);
  final appDatabase = await databaseModule.database;
  g.registerLazySingleton<AppDatabase>(() => appDatabase);
  g.registerLazySingleton<Dio>(() => databaseModule.dio);
  g.registerLazySingleton<PokemonDao>(() => databaseModule.pokemonDao);
  g.registerLazySingleton<RemotePokemonDataSource>(
      () => RemotePokemonDataSourceImpl(g<ApiClient>()));
  g.registerLazySingleton<LocalPokemonDataSource>(
      () => LocalPokemonDataSourceImpl(g<PokemonDao>()));
  g.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(
      g<LocalPokemonDataSource>(), g<RemotePokemonDataSource>()));
  g.registerFactory<GetAllPokemons>(
      () => GetAllPokemons(g<PokemonRepository>()));

  //Eager singletons must be registered in the right order
  g.registerSingleton<PokemonListViewModel>(
      PokemonListViewModel(g<GetAllPokemons>()));
}

class _$DatabaseModule extends DatabaseModule {}
