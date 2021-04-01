// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

import '../domain/entities/pokemon.dart' as _i4;
import 'details/pokemon_details_page.dart' as _i3;
import 'list/pokemon_list_page.dart' as _i2;

class Router extends _i1.RootStackRouter {
  Router();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    PokemonListPageRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.PokemonListPage());
    },
    PokemonDetailsPageRoute.name: (entry) {
      var args = entry.routeData.argsAs<PokemonDetailsPageRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i3.PokemonDetailsPage(
              pokemon: args.pokemon, backgroundColor: args.backgroundColor));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(PokemonListPageRoute.name, path: '/'),
        _i1.RouteConfig(PokemonDetailsPageRoute.name,
            path: '/pokemon-details-page')
      ];
}

class PokemonListPageRoute extends _i1.PageRouteInfo {
  const PokemonListPageRoute() : super(name, path: '/');

  static const String name = 'PokemonListPageRoute';
}

class PokemonDetailsPageRoute
    extends _i1.PageRouteInfo<PokemonDetailsPageRouteArgs> {
  PokemonDetailsPageRoute(
      {required _i4.Pokemon pokemon, required _i5.Color backgroundColor})
      : super(name,
            path: '/pokemon-details-page',
            args: PokemonDetailsPageRouteArgs(
                pokemon: pokemon, backgroundColor: backgroundColor));

  static const String name = 'PokemonDetailsPageRoute';
}

class PokemonDetailsPageRouteArgs {
  const PokemonDetailsPageRouteArgs(
      {required this.pokemon, required this.backgroundColor});

  final _i4.Pokemon pokemon;

  final _i5.Color backgroundColor;
}
