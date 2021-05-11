import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/constants/pokemon_type.dart';
import '../../../domain/entities/pokemon.dart';
import '../../router.gr.dart';
import 'pokemon_type_text.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = pokemon.primaryType?.color ?? Colors.black;
    return Hero(
      tag: "card-${pokemon.id}",
      child: Card(
        color: backgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            AutoRouter.of(context).navigate(PokemonDetailsPageRoute(
              pokemon: pokemon,
              backgroundColor: backgroundColor,
            ));
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
                  PokemonTypeText(pokemon.primaryType?.name ?? ""),
                  if (pokemon.secondaryType != null)
                    PokemonTypeText(pokemon.secondaryType?.name ?? ""),
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: 115,
              child: CachedNetworkImage(
                height: 70,
                imageUrl: pokemon.imageUrl,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
