import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

class PokemonDetailsPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsPage({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Pokemon")),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(pokemon.name),
              Hero(
                tag: "pokemon-image-${pokemon.id}",
                child: CachedNetworkImage(
                  height: 200,
                  imageUrl: pokemon.imageUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
