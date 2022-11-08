import 'package:feature_commons/feature_commons.dart';
import 'package:flutter/material.dart';

import '../pokemon_list_page_cubit.dart';
import '../pokemon_list_page_state.dart';
import 'pokemon_list_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({
    Key? key,
  }) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  void initState() {
    context.read<PokemonListPageCubit>().loadPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListPageCubit, PokemonListPageState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.errorOccurred) {
          return const Center(
            child: Text("Error"),
          );
        }

        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
          ),
          itemCount: state.pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = state.pokemons[index];

            return PokemonListItem(pokemon: pokemon);
          },
        );
      },
    );
  }
}
