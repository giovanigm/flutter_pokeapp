import 'package:injectable/injectable.dart';
import 'package:pokeapp/data/api/api.dart';
import 'package:pokeapp/data/db/database.dart';
import 'package:pokeapp/data/db/pokemon_dao.dart';
import 'package:pokeapp/injection.dart';
import 'package:dio/dio.dart';

@module
abstract class DatabaseModule {
  @preResolve
  @lazySingleton
  Future<AppDatabase> get database =>
      $FloorAppDatabase.databaseBuilder(AppDatabase.DATABASE_NAME).build();

  @lazySingleton
  PokemonDao get pokemonDao => getIt<AppDatabase>().pokemonDao;

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiClient get apiClient => ApiClient(getIt<Dio>());
}
