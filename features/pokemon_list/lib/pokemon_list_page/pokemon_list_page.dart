import 'package:feature_commons/feature_commons.dart';
import 'package:flutter/material.dart';

import '../pokemon_list_module.dart';
import 'pokemon_list_page_cubit.dart';
import 'widgets/main_app_bar.dart';
import 'widgets/pokemon_list.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final pokeballSize = MediaQuery.of(context).size.width * 0.664;
    final appBarHeight = AppBar().preferredSize.height;
    const iconButtonPadding = 28;
    final iconSize = IconTheme.of(context).size;

    final pokeballTopMargin =
        -(pokeballSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin =
        -(pokeballSize / 2 - iconButtonPadding - iconSize! / 2);

    return BlocProvider<PokemonListPageCubit>(
      create: (context) => getIt<PokemonListPageCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: pokeballTopMargin,
              right: pokeballRightMargin,
              child: Pokeball(size: pokeballSize),
            ),
            NestedScrollView(
              headerSliverBuilder: (context, _) => [MainSliverAppBar()],
              body: const PokemonList(),
            ),
          ],
        ),
      ),
    );
  }
}
