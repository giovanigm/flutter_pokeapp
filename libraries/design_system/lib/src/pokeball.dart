import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pokeball extends StatelessWidget {
  final double size;

  const Pokeball({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/pokeball.svg",
      package: "design_system",
      height: size,
      width: size,
      color: Colors.white.withOpacity(0.14),
    );
  }
}
