import 'dart:math';

import 'package:feature_commons/feature_commons.dart';
import 'package:flutter/material.dart';
import 'package:shared/entities/pokemon_type.dart';

import '../pokemon_details_module.dart';
import 'pokemon_details_page_cubit.dart';
import 'widgets/details_header.dart';
import 'widgets/pokemon_info.dart';

class PokemonDetailsPage extends StatefulWidget {
  final PokemonDetailsRouteArguments arguments;

  const PokemonDetailsPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    _cardMaxHeight = screenSize.height;

    return BlocProvider<PokemonDetailsPageCubit>(
      create: (context) =>
          getIt<PokemonDetailsPageCubit>()..init(widget.arguments.pokemonId),
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
                    return NotificationListener<
                        DraggableScrollableNotification>(
                      onNotification: (notification) {
                        final min = notification.minExtent;
                        final max = notification.maxExtent;
                        final diff = max - min;
                        final extent = notification.extent - min;
                        final extentPercentage = extent / diff;

                        _sliderController.value = extentPercentage;
                        return true;
                      },
                      child: DraggableScrollableSheet(
                        minChildSize:
                            (_cardMinHeight * _sliderHeightController.value +
                                    _pokemonSlideOverflow) /
                                screenSize.height,
                        maxChildSize: _cardMaxHeight / screenSize.height,
                        initialChildSize:
                            (_cardMinHeight * _sliderHeightController.value +
                                    _pokemonSlideOverflow) /
                                screenSize.height,
                        snap: true,
                        builder: (context, controller) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            padding: const EdgeInsets.only(top: 30),
                            child: CustomScrollView(
                              controller: controller,
                              physics: const BouncingScrollPhysics(),
                              slivers: const [],
                            ),
                          );
                        },
                      ),
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
    final currentPokemon =
        context.watch<PokemonDetailsPageCubit>().state.selectedPokemon;

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
              "assets/images/pokeball.svg",
              package: "design_system",
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
        child: Image.asset(
          "assets/images/dots.png",
          package: "design_system",
          width: screenSize.height * 0.07,
          height: screenSize.height * 0.07 * 0.54,
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}
