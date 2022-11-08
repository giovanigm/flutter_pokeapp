import 'package:feature_commons/feature_commons.dart';
import 'package:flutter/material.dart';

import '../pokemon_details_page_cubit.dart';

class PokemonPageView extends StatefulWidget {
  final AnimationController sliderController;
  final AnimationController rotationController;

  const PokemonPageView({
    Key? key,
    required this.sliderController,
    required this.rotationController,
  }) : super(key: key);

  @override
  _PokemonPageViewState createState() => _PokemonPageViewState();
}

class _PokemonPageViewState extends State<PokemonPageView> {
  static const double _pokemonSliderViewportFraction = 0.5;

  late PageController _pageController;

  AnimationController get sliderController => widget.sliderController;

  @override
  void initState() {
    final currentPokemon =
        context.read<PokemonDetailsPageCubit>().state.selectedPokemon;
    final currentPokemonId = currentPokemon?.id ?? 1;
    final initialPage = currentPokemonId - 1;
    _pageController = PageController(
      viewportFraction: _pokemonSliderViewportFraction,
      initialPage: initialPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = context.watch<PokemonDetailsPageCubit>();

    final pokemons = pokemonDetailsCubit.state.pokemons;
    final currentPokemon = pokemonDetailsCubit.state.selectedPokemon;

    final screenSize = MediaQuery.of(context).size;

    final fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: sliderController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );

    return AnimatedFade(
      animation: fadeAnimation,
      child: SizedBox(
        width: screenSize.width,
        height: screenSize.height * 0.24,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: RotationTransition(
                turns: widget.rotationController,
                child: SvgPicture.asset(
                  "assets/images/pokeball.svg",
                  package: "design_system",
                  width: screenSize.height * 0.24,
                  height: screenSize.height * 0.24,
                  color: Colors.white.withOpacity(0.14),
                ),
              ),
            ),
            PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              itemCount: pokemons.length,
              onPageChanged: (index) {
                pokemonDetailsCubit.setSelectedPokemon(pokemons[index]);
              },
              itemBuilder: (context, index) {
                final isSelected = currentPokemon?.id == index + 1;
                final pokemon = pokemons[index];

                return Hero(
                  tag: isSelected ? currentPokemon?.imageUrl ?? "" : index,
                  child: AnimatedPadding(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutQuint,
                    padding: EdgeInsets.only(
                      top: isSelected ? 0 : screenSize.height * 0.05,
                      bottom: isSelected ? 0 : screenSize.height * 0.05,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      imageBuilder: (context, image) => Image(
                        image: image,
                        width: screenSize.height * 0.3,
                        height: screenSize.height * 0.3,
                        alignment: Alignment.bottomCenter,
                        color: isSelected ? null : Colors.black26,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
