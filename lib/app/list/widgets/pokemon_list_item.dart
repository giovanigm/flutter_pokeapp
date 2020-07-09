import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/app/list/widgets/pokemon_type_text.dart';
import 'package:pokeapp/app/router.gr.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListItem({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getCardColor(),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          ExtendedNavigator.of(context).pushNamed(Routes.pokemonDetailsPage,
              arguments: PokemonDetailsPageArguments(pokemon: pokemon));
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
                PokemonTypeText(pokemon.types.first),
                if (pokemon.types.length == 2)
                  PokemonTypeText(pokemon.types[1]),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 115,
            child: Hero(
              tag: "pokemon-image-${pokemon.id}",
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

  Color _getCardColor() {
    if (pokemon.types.isEmpty) return Colors.black;

    String firstType = pokemon.types.first;

    switch (firstType.toLowerCase()) {
      case "bug":
        return Color(0xFF3c9950);

      case "dark":
        return Color(0xFF595978);

      case "dragon":
        return Color(0xFF62cad9);

      case "electric":
        return Color(0xFFffd86f);

      case "fairy":
        return Color(0xFFe91368);

      case "fighting":
        return Color(0xFFef6239);

      case "fire":
        return Color(0xFFfb6c6c);

      case "flying":
        return Color(0xFF94b2c7);

      case "ghost":
        return Color(0xFF906791);

      case "grass":
        return Color(0xFF48d0b0);

      case "ground":
        return Color(0xFF6e491f);

      case "ice":
        return Color(0xFF86DCFF);

      case "normal":
        return Color(0xFFca98a6);

      case "poison":
        return Color(0xFF9b69da);

      case "psychic":
        return Color(0xFFf71d92);

      case "rock":
        return Color(0xFF8b3e22);

      case "steel":
        return Color(0xFF43bd94);

      case "water":
        return Color(0xFF0085FF);

      default:
        return Colors.black;
    }
  }
}
