// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:domain/domain.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/api.dart' as _i3;
import 'db/database.dart' as _i4;
import 'db/pokemon_dao.dart' as _i6;
import 'di/data_module.dart' as _i11;
import 'repositories/pokemon/pokemon_local_data_source.dart' as _i7;
import 'repositories/pokemon/pokemon_remote_data_source.dart' as _i8;
import 'repositories/pokemon/pokemon_repository_impl.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.PokemonLocalDataSource>(
      () => _i7.PokemonLocalDataSourceImpl(get<_i6.PokemonDao>()));
  gh.lazySingleton<_i8.PokemonRemoteDataSource>(
      () => _i8.PokemonRemoteDataSourceImpl(get<_i3.ApiClient>()));
  gh.lazySingleton<_i9.PokemonRepository>(() => _i10.PokemonRepositoryImpl(
      get<_i7.PokemonLocalDataSource>(), get<_i8.PokemonRemoteDataSource>()));
  return get;
}

class _$DatabaseModule extends _i11.DatabaseModule {}
