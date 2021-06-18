import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/app/core/extensions/pokemon_type_extensions.dart';
import 'package:pokeapp/app/details/pokemon_details_cubit.dart';
import 'package:pokeapp/app/details/widgets/pokemon_info.dart';
import 'package:pokeapp/app/details/widgets/pokemon_page_view.dart';
import 'package:pokeapp/injection.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../domain/entities/pokemon.dart';

class PokemonDetailsPage extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailsPage({
    required this.pokemon,
  });

  static MaterialPageRoute route({required Pokemon pokemon}) =>
      MaterialPageRoute(
        builder: (context) => PokemonDetailsPage(pokemon: pokemon),
      );

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

      _cardMinHeight =
          screenHeight - kToolbarHeight - (pokemonInfoBox?.size.height ?? 300);
      _cardMaxHeight =
          screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;

      _sliderHeightController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonDetailsCubit>(
      create: (context) =>
          getIt<PokemonDetailsCubit>()..init(pokemon: widget.pokemon),
      child: Stack(
        children: [
          const _Background(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: [
                _buildSlider(),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    key: _pokemonInfoKey,
                    child: PokemonPageView(
                      sliderController: _sliderController,
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

  AnimatedBuilder _buildSlider() {
    return AnimatedBuilder(
      animation: _sliderHeightController,
      builder: (_, child) {
        return SlidingUpPanel(
          minHeight: _cardMinHeight * _sliderHeightController.value +
              _pokemonSlideOverflow,
          maxHeight: _cardMaxHeight,
          boxShadow: null,
          color: Colors.transparent,
          onPanelSlide: (position) => _sliderController.value = position,
          panelBuilder: (sc) => PokemonInfo(
            sliderController: _sliderController,
            scrollController: sc,
          ),
        );
      },
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
      color: currentPokemon?.primaryType?.color,
    );
  }
}
