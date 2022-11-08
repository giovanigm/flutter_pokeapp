import 'package:flutter/material.dart';

class AnimatedFade extends AnimatedWidget {
  const AnimatedFade({
    Key? key,
    required this.child,
    required this.animation,
  }) : super(key: key, listenable: animation);

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final opacity = animation.value;

    return IgnorePointer(
      ignoring: opacity < 1,
      child: Opacity(
        opacity: opacity,
        child: child,
      ),
    );
  }
}
