import 'package:feature_commons/feature_commons.dart';

import 'pokemon_details_page/pokemon_details_page_cubit.dart';
import 'pokemon_details_page/pokemon_details_page_model.dart';

late GetIt getIt;

Future<void> configPokemonDetailsModule(GetIt getItInstance) async {
  getIt = getItInstance;

  getIt.registerFactory<PokemonDetailsPageModel>(
      () => PokemonDetailsPageModel(getIt()));
  getIt.registerFactory<PokemonDetailsPageCubit>(
      () => PokemonDetailsPageCubit(getIt()));
}
