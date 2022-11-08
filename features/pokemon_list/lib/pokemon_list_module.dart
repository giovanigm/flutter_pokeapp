import 'package:feature_commons/feature_commons.dart';
import 'package:pokemon_api/pokemon_api.dart';

import 'pokemon_list_page/pokemon_list_page_cubit.dart';
import 'pokemon_list_page/pokemon_list_page_model.dart';

late GetIt getIt;

Future<void> configPokemonListModule(GetIt getItInstance) async {
  getIt = getItInstance;

  getIt.registerLazySingleton<PokemonListPageCubit>(
      () => PokemonListPageCubit(getIt()));
  getIt.registerLazySingleton<PokemonListPageModel>(
      () => PokemonListPageModel(PokemonApi(), getIt()));
}
