import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:pokemon_details/pokemon_details_page/pokemon_details_page.dart';
import 'package:pokemon_list/pokemon_list_page/pokemon_list_page.dart';
import 'package:splash/splash_page/splash_page.dart';

class RouteConfig {
  RouteConfig._();

  static final String initialRoute = Routes.splashRoute.route;

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final deeplink = Uri.parse(settings.name ?? "");
    final routeName = deeplink.pathSegments.first;

    late Widget page;

    if (Routes.splashRoute.route == routeName) {
      page = Routes.splashRoute.parser(
        deeplink,
        ({arguments}) => const SplashPage(),
      );
    } else if (Routes.pokemonListRoute.route == routeName) {
      page = Routes.pokemonListRoute.parser(
        deeplink,
        ({arguments}) => const PokemonListPage(),
      );
    } else if (Routes.pokemonDetailsRoute.route == routeName) {
      page = Routes.pokemonDetailsRoute.parser(
        deeplink,
        ({arguments}) {
          if (arguments == null) throw Error();

          return PokemonDetailsPage(
              arguments: arguments as PokemonDetailsRouteArguments);
        },
      );
    } else {
      throw Exception('Unknown route: ${settings.name}');
    }

    return FadePageRoute<dynamic>(
      page: page,
      settings: settings,
    );
  }
}
