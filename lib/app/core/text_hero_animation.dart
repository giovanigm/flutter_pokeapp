import 'package:flutter/material.dart';

class TextHeroAnimation extends StatelessWidget {
  final Widget child;
  final String tag;

  const TextHeroAnimation({Key key, this.child, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      flightShuttleBuilder: (_,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext) {
        // return AnimatedDefaultTextStyle(
        //   duration: Duration(milliseconds: 1000),
        //   child: ((toHeroContext.widget as Hero).child as Text),
        //   style: flightDirection == HeroFlightDirection.pop
        //       ? ((fromHeroContext.widget as Hero).child as Text).style
        //       : ((fromHeroContext.widget as Hero).child as Text).style,
        // );
        // print("FromHeroContext");
        // print(((fromHeroContext.widget as Hero).child as Text).style);

        // print("ToHeroContext");
        // print(((toHeroContext.widget as Hero).child as Text).style);

        // print(flightDirection);

        // print(animation.value);

        // print(TextStyle.lerp(
        //     ((fromHeroContext.widget as Hero).child as Text).style,
        //     ((toHeroContext.widget as Hero).child as Text).style,
        //     flightDirection == HeroFlightDirection.pop
        //         ? 1 - animation.value
        //         : animation.value));

        // return AnimatedBuilder(
        //     animation: animation,
        //     builder: (context, _child) {
        //       print(TextStyleTween(
        //               begin: ((fromHeroContext.widget as Hero).child as Text)
        //                   .style,
        //               end: ((toHeroContext.widget as Hero).child as Text).style)
        //           .lerp(animation.value));
        //       return DefaultTextStyle(
        //         child: ((toHeroContext.widget as Hero).child as Text),
        //         style: TextStyleTween(
        //                 begin: ((fromHeroContext.widget as Hero).child as Text)
        //                     .style,
        //                 end: ((toHeroContext.widget as Hero).child as Text)
        //                     .style)
        //             .animate(animation)
        //             .value,
        //       );
        //     });

        // return AnimatedDefaultTextStyle(
        //   duration: Duration(seconds: 1),
        //   child: ((toHeroContext.widget as Hero).child as Text),
        //   style: ((toHeroContext.widget as Hero).child as Text).style,

        //   // style: TextStyle.lerp(
        //   //     ((fromHeroContext.widget as Hero).child as Text).style,
        //   //     ((toHeroContext.widget as Hero).child as Text).style,
        //   //     flightDirection == HeroFlightDirection.pop
        //   //         ? 1 - animation.value
        //   //         : animation.value),
        // );

        final fromText = (fromHeroContext.widget as Hero).child as Text;
        final toText = (toHeroContext.widget as Hero).child as Text;
        double fromTextSize = fromText.style.fontSize;
        double toTextSize = toText.style.fontSize;

        print(fromText);
        print(toText);

        if (flightDirection == HeroFlightDirection.push) {
          return TextResizeTransition(
            sizeAnim: animation,
            minFontSize: toTextSize,
            maxFontSize: fromTextSize,
            child: fromText,
          );
        }

        return TextResizeTransition(
          child: toText,
          sizeAnim: animation,
          minFontSize: fromTextSize,
          maxFontSize: toTextSize,
        );
      },
      tag: tag,
      child: child,
    );
  }
}

class TextResizeTransition extends AnimatedWidget {
  final Animation<double> sizeAnim;
  final double minFontSize;
  final double maxFontSize;
  final Text child;

  TextResizeTransition({
    this.sizeAnim,
    this.child,
    this.minFontSize,
    this.maxFontSize,
  }) : super(listenable: sizeAnim);

  @override
  Widget build(BuildContext context) {
    final delta = maxFontSize - minFontSize;
    return Material(
      color: Colors.transparent,
      child: Text(
        child.data,
        style: child.style
            .copyWith(fontSize: maxFontSize - delta * (sizeAnim.value)),
      ),
    );
  }
}
