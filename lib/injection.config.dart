// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/details/pokemon_details_cubit.dart' as _i7;
import 'app/list/pokemon_list_cubit.dart' as _i13;
import 'data/api/api.dart' as _i3;
import 'data/db/database.dart' as _i4;
import 'data/db/pokemon_dao.dart' as _i6;
import 'data/di/data_module.dart' as _i14;
import 'data/repositories/pokemon/pokemon_local_data_source.dart' as _i8;
import 'data/repositories/pokemon/pokemon_remote_data_source.dart' as _i9;
import 'data/repositories/pokemon/pokemon_repository_impl.dart' as _i11;
import 'domain/repositories/pokemon_repository.dart' as _i10;
import 'domain/usecases/get_all_pokemons.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final databaseModule = _$DatabaseModule();
  gh.lazySingleton<_i3.ApiClient>(() => databaseModule.apiClient);
  await gh.lazySingletonAsync<_i4.AppDatabase>(() => databaseModule.database,
      preResolve: true);
  gh.lazySingleton<_i5.Dio>(() => databaseModule.dio);
  gh.lazySingleton<_i6.PokemonDao>(() => databaseModule.pokemonDao);
  gh.factory<_i7.PokemonDetailsCubit>(() => _i7.PokemonDetailsCubit());
  gh.lazySingleton<_i8.PokemonLocalDataSource>(
      () => _i8.PokemonLocalDataSourceImpl(get<_i6.PokemonDao>()));
  gh.lazySingleton<_i9.PokemonRemoteDataSource>(
      () => _i9.PokemonRemoteDataSourceImpl(get<_i3.ApiClient>()));
  gh.lazySingleton<_i10.PokemonRepository>(() => _i11.PokemonRepositoryImpl(
      get<_i8.PokemonLocalDataSource>(), get<_i9.PokemonRemoteDataSource>()));
  gh.factory<_i12.GetAllPokemons>(
      () => _i12.GetAllPokemons(get<_i10.PokemonRepository>()));
  gh.singleton<_i13.PokemonListCubit>(
      _i13.PokemonListCubit(get<_i12.GetAllPokemons>()));
  return get;
}

class _$DatabaseModule extends _i14.DatabaseModule {}
