// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../domain/entities/pokemon.dart';
import 'details/pokemon_details_page.dart';
import 'list/pokemon_list_page.dart';

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
    PokemonListPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PokemonListPage(),
        settings: data,
      );
    },
    PokemonDetailsPage: (data) {
      final args = data.getArgs<PokemonDetailsPageArguments>(
        orElse: () => PokemonDetailsPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => PokemonDetailsPage(
          key: args.key,
          pokemon: args.pokemon,
          backgroundColor: args.backgroundColor,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// PokemonDetailsPage arguments holder class
class PokemonDetailsPageArguments {
  final Key key;
  final Pokemon pokemon;
  final Color backgroundColor;
  PokemonDetailsPageArguments({this.key, this.pokemon, this.backgroundColor});
}
