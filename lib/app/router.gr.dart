// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pokeapp/app/list/pokemon_list_page.dart';
import 'package:pokeapp/app/details/pokemon_details_page.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

class Routes {
  static const String pokemonListPage = '/';
  static const String pokemonDetailsPage = '/pokemon-details-page';
  static const all = <String>{
    pokemonListPage,
    pokemonDetailsPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.pokemonListPage, page: PokemonListPage),
    RouteDef(Routes.pokemonDetailsPage, page: PokemonDetailsPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    PokemonListPage: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PokemonListPage(),
        settings: data,
      );
    },
    PokemonDetailsPage: (RouteData data) {
      var args = data.getArgs<PokemonDetailsPageArguments>(
          orElse: () => PokemonDetailsPageArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            PokemonDetailsPage(key: args.key, pokemon: args.pokemon),
        settings: data,
      );
    },
  };
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//PokemonDetailsPage arguments holder class
class PokemonDetailsPageArguments {
  final Key key;
  final Pokemon pokemon;
  PokemonDetailsPageArguments({this.key, this.pokemon});
}
