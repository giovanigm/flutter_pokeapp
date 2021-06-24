import 'package:domain/constants/pokemon_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/app/details/pokemon_details_cubit.dart';
import 'package:pokeapp/app/list/widgets/pokemon_type_text.dart';
import 'package:pokeapp/app/widgets/animated_fade.dart';
import 'package:pokeapp/app/widgets/animated_slide.dart';

import 'pokemon_page_view.dart';

class DetailsHeader extends StatefulWidget {
  final AnimationController sliderController;
  final AnimationController rotationController;

  const DetailsHeader({
    Key? key,
    required this.sliderController,
    required this.rotationController,
  }) : super(key: key);

  @override
  _DetailsHeaderState createState() => _DetailsHeaderState();
}

class _DetailsHeaderState extends State<DetailsHeader>
    with TickerProviderStateMixin {
  final GlobalKey _currentTextKey = GlobalKey();
  final GlobalKey _targetTextKey = GlobalKey();

  double textDiffLeft = 0.0;
  double textDiffTop = 0.0;

  late AnimationController _slideController;

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    _slideController.forward();

    _calculatePokemonNamePosition();

    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();

    super.dispose();
  }

  void _calculatePokemonNamePosition() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final targetTextBox =
          _targetTextKey.currentContext?.findRenderObject() as RenderBox?;
      final targetTextPosition = targetTextBox?.localToGlobal(Offset.zero);

      final currentTextBox =
          _currentTextKey.currentContext?.findRenderObject() as RenderBox?;
      final currentTextPosition = currentTextBox?.localToGlobal(Offset.zero);

      if (targetTextPosition != null && currentTextPosition != null) {
        final newDiffLeft = targetTextPosition.dx - currentTextPosition.dx;
        final newDiffTop = targetTextPosition.dy - currentTextPosition.dy;

        if (newDiffLeft != textDiffLeft || newDiffTop != textDiffTop) {
          setState(() {
            textDiffLeft = newDiffLeft;
            textDiffTop = newDiffTop;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PokemonDetailsCubit>();
    final pokemon = cubit.state.pokemon;
    final sliderController = widget.sliderController;
    final fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(sliderController);

    _calculatePokemonNamePosition();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          title: Text(
            pokemon?.name ?? "",
            key: _targetTextKey,
            style: const TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedBuilder(
                animation: sliderController,
                builder: (context, child) {
                  final value = sliderController.value;

                  return Transform.translate(
                    offset: Offset(textDiffLeft * value, textDiffTop * value),
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        pokemon?.name ?? "",
                        key: _currentTextKey,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 36 - (36 - 22) * value,
                        ),
                      ),
                    ),
                  );
                },
              ),
              AnimatedSlide(
                animation: _slideController,
                child: AnimatedFade(
                  animation: fadeAnimation,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      pokemon?.number ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedFade(
          animation: fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, top: 5),
            child: Row(
              children: <Widget>[
                Wrap(spacing: 8, runSpacing: 8, children: [
                  PokemonTypeText(pokemon?.primaryType.name ?? ""),
                  if (pokemon?.secondaryType != null)
                    PokemonTypeText(pokemon?.secondaryType?.name ?? "")
                ]),
              ],
            ),
          ),
        ),
        PokemonPageView(
          sliderController: widget.sliderController,
          rotationController: widget.rotationController,
        ),
      ],
    );
  }
}
