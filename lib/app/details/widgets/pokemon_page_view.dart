import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/app/details/pokemon_details_cubit.dart';
import 'package:pokeapp/app/list/pokemon_list_cubit.dart';
import 'package:pokeapp/app/resources/app_images.dart';
import 'package:pokeapp/app/widgets/animated_fade.dart';

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
    final currentPokemonId =
        context.read<PokemonDetailsCubit>().state.pokemon?.id ?? 1;
    final initialPage = currentPokemonId - 1;
    _pageController = PageController(
      viewportFraction: _pokemonSliderViewportFraction,
      initialPage: initialPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonListCubit = context.watch<PokemonListCubit>();
    final pokemonDetailsCubit = context.watch<PokemonDetailsCubit>();

    final pokemons = pokemonListCubit.state.list;
    final currentPokemon = pokemonDetailsCubit.state.pokemon;

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
                  AppImages.pokeball.assetName,
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
                pokemonDetailsCubit.setPokemon(pokemons[index]);
              },
              itemBuilder: (context, index) {
                final selected = currentPokemon?.id == index + 1;
                final pokemon = pokemons[index];

                return Hero(
                  tag: selected ? pokemon.imageUrl : index,
                  child: AnimatedPadding(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutQuint,
                    padding: EdgeInsets.only(
                      top: selected ? 0 : screenSize.height * 0.05,
                      bottom: selected ? 0 : screenSize.height * 0.05,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: pokemons[index].imageUrl,
                      imageBuilder: (context, image) => Image(
                        image: image,
                        width: screenSize.height * 0.3,
                        height: screenSize.height * 0.3,
                        alignment: Alignment.bottomCenter,
                        color: selected ? null : Colors.black26,
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
