import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/app/core/extensions/pokemon_type_extensions.dart';
import 'package:pokeapp/app/details/pokemon_details_page.dart';

import '../../../domain/constants/pokemon_type.dart';
import '../../../domain/entities/pokemon.dart';
import 'pokemon_type_text.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  // static const double _pokeballFraction = 0.75;
  // static const double _pokemonFraction = 0.76;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = pokemon.primaryType.color;
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
          Positioned(
            left: 85,
            top: 20,
            child: SizedBox(
              height: 150,
              child: SvgPicture.asset(
                "assets/pokeball.svg",
                color: const Color(0x26FFFFFF),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: Text(
              pokemon.name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 10,
            left: 130,
            child: Text(
              "#${pokemon.id.toString().padLeft(3, '0')}",
              style: const TextStyle(
                  color: Color(0x26000000),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 60,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PokemonTypeText(pokemon.primaryType.name),
                if (pokemon.secondaryType != null)
                  PokemonTypeText(pokemon.secondaryType?.name ?? ""),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 115,
            child: Hero(
              tag: pokemon.imageUrl,
              child: CachedNetworkImage(
                height: 70,
                imageUrl: pokemon.imageUrl,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
