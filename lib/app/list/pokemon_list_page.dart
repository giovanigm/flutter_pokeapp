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
          builder: (context, state) =>
              NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1.5),
                        itemCount: state.list.length + 1,
                        itemBuilder: (context, index) {
                          if (index >= state.list.length) {
                            context.read<PokemonListCubit>().loadList();
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final pokemon = state.list[index];

                          return PokemonListItem(
                            pokemon: pokemon,
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
