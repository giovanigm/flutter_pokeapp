import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/app/core/fade_page_route.dart';
import 'package:pokeapp/app/resources/app_images.dart';
import 'package:pokeapp/app/widgets/main_app_bar.dart';
import 'widgets/pokemon_list.dart';

class PokemonListPage extends StatelessWidget {
  static FadePageRoute route() => FadePageRoute(page: PokemonListPage());

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
              AppImages.pokeball.assetName,
              width: pokeballSize,
              height: pokeballSize,
              color: Colors.black.withOpacity(0.05),
            ),
          ),
          NestedScrollView(
            headerSliverBuilder: (context, _) => [MainSliverAppBar()],
            body: const PokemonList(),
          ),
        ],
      ),
    );
  }
}
