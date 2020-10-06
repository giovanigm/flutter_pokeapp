import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/app/list/widgets/pokemon_type_text.dart';
import 'package:pokeapp/app/router.gr.dart';
import 'package:pokeapp/domain/constants/pokemon_type.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListItem({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = pokemon.types.first.color;
    return Hero(
      tag: "card-${pokemon.id}",
      child: Card(
        color: backgroundColor,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            ExtendedNavigator.root.push(Routes.pokemonDetailsPage,
                arguments: PokemonDetailsPageArguments(
                    pokemon: pokemon, backgroundColor: backgroundColor));
          },
          child: Stack(children: <Widget>[
            Positioned(
              left: 25,
              top: 20,
              child: Container(
                height: 150,
                child: SvgPicture.asset(
                  "assets/pokeball.svg",
                  color: Color(0x26FFFFFF),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: Text(
                pokemon.name,
                style: TextStyle(
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
                style: TextStyle(
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
                  PokemonTypeText(pokemon.types.first.name),
                  if (pokemon.types.length == 2)
                    PokemonTypeText(pokemon.types[1].name),
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
