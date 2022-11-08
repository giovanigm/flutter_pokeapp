import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Dots extends StatelessWidget {
  final double size;

  const Dots({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/dots.png",
      package: "design_system",
      height: size,
      width: size,
      color: Colors.white.withOpacity(0.14),
    );
  }
}
