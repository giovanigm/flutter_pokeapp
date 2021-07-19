import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../injection.dart';
import '../api/api.dart';
import '../db/database.dart';
import '../db/pokemon_dao.dart';

@module
abstract class DatabaseModule {
  @preResolve
  @lazySingleton
  Future<AppDatabase> get database =>
      $FloorAppDatabase.databaseBuilder(AppDatabase.databaseName).build();

  @lazySingleton
  PokemonDao get pokemonDao => getIt<AppDatabase>().pokemonDao;

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiClient get apiClient => ApiClient(getIt<Dio>());
}
