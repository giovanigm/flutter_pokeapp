import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/app/widgets/pokeball_loading.dart';

import '../pokemon_list_cubit.dart';
import '../pokemon_list_state.dart';
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
    context.read<PokemonListCubit>().loadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListCubit, PokemonListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: PokeballLoading(),
          );
        }

        if (state.errorMessage != null) {
          return Center(
            child: Text(state.errorMessage ?? ""),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: state.list.length,
          itemBuilder: (context, index) {
            final pokemon = state.list[index];

            return PokemonListItem(pokemon: pokemon);
          },
        );
      },
    );
  }
}
