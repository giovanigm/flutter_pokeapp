import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeapp/app/resources/app_images.dart';

class PokeballLoading extends StatefulWidget {
  const PokeballLoading({Key? key}) : super(key: key);

  @override
  _PokeballLoadingState createState() => _PokeballLoadingState();
}

class _PokeballLoadingState extends State<PokeballLoading>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationController,
      child: SvgPicture.asset(
        AppImages.pokeball.assetName,
        width: 60,
        height: 60,
        color: Colors.black.withOpacity(0.3),
      ),
    );
  }
}
