import 'dart:math';

import 'package:domain/entities/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapp/app/core/extensions/pokemon_type_extensions.dart';
import 'package:pokeapp/app/core/fade_page_route.dart';
import 'package:pokeapp/app/details/pokemon_details_cubit.dart';
import 'package:pokeapp/app/details/widgets/details_header.dart';
import 'package:pokeapp/app/details/widgets/pokemon_info.dart';
import 'package:pokeapp/app/resources/app_images.dart';
import 'package:pokeapp/app/widgets/animated_fade.dart';
import 'package:pokeapp/injection.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonDetailsPage extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailsPage({
    required this.pokemon,
  });

  static FadePageRoute route({required Pokemon pokemon}) =>
      FadePageRoute(page: PokemonDetailsPage(pokemon: pokemon));

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with TickerProviderStateMixin {
  double _cardMinHeight = 0.0;
  double _cardMaxHeight = 0.0;
  static const double _pokemonSlideOverflow = 20;

  late AnimationController _sliderController;
  late AnimationController _sliderHeightController;
  late AnimationController _rotateController;

  final GlobalKey _pokemonInfoKey = GlobalKey();

  @override
  void dispose() {
    _sliderController.dispose();
    _sliderHeightController.dispose();
    _rotateController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _sliderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _sliderHeightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final screenHeight = MediaQuery.of(context).size.height;

      final pokemonInfoBox =
          _pokemonInfoKey.currentContext?.findRenderObject() as RenderBox?;

      _cardMinHeight = screenHeight - (pokemonInfoBox?.size.height ?? 300);
      _cardMaxHeight =
          screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;

      _sliderHeightController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocProvider<PokemonDetailsCubit>(
      create: (context) =>
          getIt<PokemonDetailsCubit>()..init(pokemon: widget.pokemon),
      child: Stack(
        children: [
          const _Background(),
          Positioned(
            top: -screenSize.height * 0.055,
            left: -screenSize.height * 0.055,
            child: const _DecorationBox(),
          ),
          _DotsDecoration(fadeController: _sliderController),
          _RotatingPokeballDecoration(
            fadeController: _sliderController,
            rotationController: _rotateController,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                AnimatedBuilder(
                  animation: _sliderHeightController,
                  builder: (_, child) {
                    return SlidingUpPanel(
                      minHeight:
                          _cardMinHeight * _sliderHeightController.value +
                              _pokemonSlideOverflow,
                      maxHeight: _cardMaxHeight,
                      boxShadow: null,
                      color: Colors.transparent,
                      onPanelSlide: (position) =>
                          _sliderController.value = position,
                      panel: child,
                    );
                  },
                  child: PokemonInfo(
                    sliderController: _sliderController,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    key: _pokemonInfoKey,
                    child: DetailsHeader(
                      sliderController: _sliderController,
                      rotationController: _rotateController,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPokemon = context.watch<PokemonDetailsCubit>().state.pokemon;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      constraints: const BoxConstraints.expand(),
      color: currentPokemon?.primaryType.color,
    );
  }
}

class _DecorationBox extends StatelessWidget {
  static const double boxSizeFraction = 0.176;

  const _DecorationBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxSize = MediaQuery.of(context).size.height * boxSizeFraction;

    return Transform.rotate(
      angle: pi * 5 / 12,
      child: Container(
        width: boxSize,
        height: boxSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: const Alignment(-0.2, -0.2),
            end: const Alignment(1.5, -0.3),
            colors: [
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}

class _RotatingPokeballDecoration extends StatelessWidget {
  final AnimationController fadeController;
  final AnimationController rotationController;

  const _RotatingPokeballDecoration({
    Key? key,
    required this.fadeController,
    required this.rotationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final safeAreaTop = MediaQuery.of(context).padding.top;

    final pokeSize = screenSize.width * 0.5;
    final appBarHeight = AppBar().preferredSize.height;
    const iconButtonPadding = 28;
    final iconSize = IconTheme.of(context).size;

    final pokeballTopMargin = -(pokeSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin =
        -(pokeSize / 2 - iconButtonPadding - (iconSize ?? 0) / 2);

    return Positioned(
      top: pokeballTopMargin,
      right: pokeballRightMargin,
      child: IgnorePointer(
        child: AnimatedFade(
          animation: fadeController,
          child: RotationTransition(
            turns: rotationController,
            child: SvgPicture.asset(
              AppImages.pokeball.assetName,
              width: pokeSize,
              height: pokeSize,
              color: Colors.white.withOpacity(0.26),
            ),
          ),
        ),
      ),
    );
  }
}

class _DotsDecoration extends StatelessWidget {
  final AnimationController fadeController;

  const _DotsDecoration({Key? key, required this.fadeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Positioned(
      top: 4,
      left: screenSize.height * 0.3,
      child: AnimatedFade(
        animation: Tween(begin: 1.0, end: 0.0).animate(fadeController),
        child: Image(
          image: AppImages.dots,
          width: screenSize.height * 0.07,
          height: screenSize.height * 0.07 * 0.54,
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}
