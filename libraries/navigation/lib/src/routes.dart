import 'routes/pokemon_details_route.dart';
import 'routes/pokemon_list_route.dart';
import 'routes/splash_route.dart';

export 'routes/pokemon_details_route.dart';
export 'routes/pokemon_list_route.dart';
export 'routes/splash_route.dart';

class Routes {
  Routes._();

  static SplashRoute splashRoute = SplashRoute();
  static PokemonListRoute pokemonListRoute = PokemonListRoute();
  static PokemonDetailsRoute pokemonDetailsRoute = PokemonDetailsRoute();
}
