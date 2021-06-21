import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/app/core/extensions/pokemon_type_extensions.dart';
import 'package:pokeapp/app/details/pokemon_details_page.dart';
import 'package:pokeapp/app/resources/app_images.dart';

import '../../../domain/constants/pokemon_type.dart';
import '../../../domain/entities/pokemon.dart';
import 'pokemon_type_text.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = pokemon.primaryType.color;
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxHeight;
        final cardWidth = constraints.maxWidth;
        return Card(
          color: backgroundColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                PokemonDetailsPage.route(pokemon: pokemon),
              );
            },
            child: Stack(children: <Widget>[
              _PokeballDecoration(parentHeight: cardHeight),
              _PokemonImage(
                pokemonImageUrl: pokemon.imageUrl,
                parentHeight: cardHeight,
              ),
              Positioned(
                top: cardHeight * 0.14,
                left: cardWidth * 0.05,
                child: Text(
                  pokemon.name,
                  style: TextStyle(
                      fontSize: cardWidth * 0.09,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: cardHeight * 0.1,
                right: cardWidth * 0.05,
                child: Text(
                  pokemon.number,
                  style: TextStyle(
                    fontSize: cardWidth * 0.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.black12,
                  ),
                ),
              ),
              Positioned(
                top: cardHeight * 0.4,
                left: cardWidth * 0.05,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PokemonTypeText(
                      pokemon.primaryType.name,
                      fontSize: cardWidth * 0.06,
                    ),
                    if (pokemon.secondaryType != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: PokemonTypeText(
                          pokemon.secondaryType?.name ?? "",
                          fontSize: cardWidth * 0.06,
                        ),
                      ),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

class _PokemonImage extends StatelessWidget {
  static const double _pokemonFraction = 0.7;

  final String pokemonImageUrl;
  final double parentHeight;

  const _PokemonImage({
    Key? key,
    required this.pokemonImageUrl,
    required this.parentHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = parentHeight * _pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: Hero(
        tag: pokemonImageUrl,
        child: CachedNetworkImage(
          width: size,
          height: size,
          imageUrl: pokemonImageUrl,
          errorWidget: (_, __, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

class _PokeballDecoration extends StatelessWidget {
  static const double _pokeballFraction = 0.75;

  final double parentHeight;

  const _PokeballDecoration({
    Key? key,
    required this.parentHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = parentHeight * _pokeballFraction;

    return Positioned(
      bottom: -parentHeight * 0.13,
      right: -parentHeight * 0.03,
      child: SvgPicture.asset(
        AppImages.pokeball.assetName,
        height: size,
        width: size,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }
}
