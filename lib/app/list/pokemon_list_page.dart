import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/injection.dart';

import 'pokemon_list_cubit.dart';
import 'pokemon_list_state.dart';
import 'widgets/pokemon_list_item.dart';

class PokemonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokeApp"),
      ),
      body: BlocProvider<PokemonListCubit>(
        create: (_) => getIt<PokemonListCubit>()..loadList(),
        child: BlocBuilder<PokemonListCubit, PokemonListState>(
          builder: (context, state) => CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index >= state.list.length - 1) {
                      context.read<PokemonListCubit>().loadList();
                    }

                    final pokemon = state.list[index];

                    return PokemonListItem(
                      pokemon: pokemon,
                    );
                  },
                  childCount: state.list.length,
                ),
              ),
              if (state.isLoading)
                const SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ))
            ],
          ),
        ),
      ),
    );
  }
}
