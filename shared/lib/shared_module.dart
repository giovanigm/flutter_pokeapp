import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared/data/pokemon_dao.dart';
import 'package:shared/data/pokemon_data.dart';

import 'entities/pokemon_type.dart';

late GetIt getIt;

Future<void> configSharedModule(GetIt getItInstance) async {
  getIt = getItInstance;

  await Hive.initFlutter();

  Hive.registerAdapter(PokemonTypeAdapter());
  Hive.registerAdapter(PokemonDataAdapter());

  final pokemonDao = await PokemonDao.init();

  getIt.registerLazySingleton<PokemonDao>(() => pokemonDao);
}
