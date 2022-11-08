import 'package:get_it/get_it.dart';
import 'package:pokemon_details/pokemon_details_module.dart';
import 'package:pokemon_list/pokemon_list_module.dart';
import 'package:shared/shared_module.dart';
import 'package:splash/splash_module.dart';

final getIt = GetIt.instance;

Future<void> configInjection() async {
  await configSharedModule(getIt);
  await configSplashModule(getIt);
  await configPokemonListModule(getIt);
  await configPokemonDetailsModule(getIt);
}
