import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/app/widgets/main_app_bar.dart';

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
      builder: (context, state) => NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [MainSliverAppBar()],
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
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
    );
  }
}
