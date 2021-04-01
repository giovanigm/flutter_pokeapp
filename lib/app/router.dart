import 'package:auto_route/annotations.dart';

import 'details/pokemon_details_page.dart';
import 'list/pokemon_list_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: PokemonListPage, initial: true),
    MaterialRoute(page: PokemonDetailsPage),
  ],
)
class $Router {}
