// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/domain.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data_sources/pokemon/pokemon_local_data_source.dart' as _i5;
import 'data_sources/pokemon/pokemon_remote_data_source.dart' as _i6;
import 'repositories/pokemon_repository_impl.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.PokemonRepository>(() => _i4.PokemonRepositoryImpl(
      get<_i5.PokemonLocalDataSource>(), get<_i6.PokemonRemoteDataSource>()));
  return get;
}
