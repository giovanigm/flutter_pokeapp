import 'package:flutter/material.dart' hide Route;

import '../core/route.dart';

class PokemonDetailsRoute extends Route {
  @override
  String get route => "pokemons";

  @override
  Widget parser(
    Uri deeplink,
    Widget Function({Object? arguments}) pageBuilder,
  ) {
    final pathSegments = deeplink.pathSegments;
    final pokemonId = int.parse(pathSegments[1]);
    final parameters = deeplink.queryParameters;
    String? imageUrl;
    if (parameters.containsKey("imageUrl")) {
      imageUrl = parameters["imageUrl"];
    }

    return pageBuilder(
      arguments: PokemonDetailsRouteArguments(
        pokemonId: pokemonId,
        imageUrl: imageUrl,
      ),
    );
  }

  String build({
    required int pokemonId,
    String? imageUrl,
  }) {
    final pokemonRoute = "$route/$pokemonId";
    final pokemonImageUrl = imageUrl;
    if (pokemonImageUrl == null) {
      return pokemonRoute;
    } else {
      return "$pokemonRoute?imageUrl=$pokemonImageUrl";
    }
  }
}

class PokemonDetailsRouteArguments {
  final int pokemonId;
  final String? imageUrl;

  PokemonDetailsRouteArguments({
    required this.pokemonId,
    this.imageUrl,
  });
}
