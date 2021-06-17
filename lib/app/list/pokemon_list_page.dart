import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/pokemon_list.dart';

class PokemonListPage extends StatelessWidget {
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: pokeballTopMargin,
            right: pokeballRightMargin,
            child: SvgPicture.asset(
              "assets/pokeball.svg",
              width: pokeballSize,
              height: pokeballSize,
              color: Colors.black.withOpacity(0.05),
            ),
          ),
          const PokemonList(),
        ],
      ),
    );
  }
}
