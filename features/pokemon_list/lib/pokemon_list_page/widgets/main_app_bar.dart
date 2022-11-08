import 'package:flutter/material.dart';

const double mainAppbarPadding = 28;

class MainSliverAppBar extends SliverAppBar {
  static const TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: kToolbarHeight / 3,
    height: 1,
  );

  MainSliverAppBar({
    Key? key,
    String title = 'Pokédex',
    double height = kToolbarHeight + mainAppbarPadding * 2,
    double expandedFontSize = 30,
  }) : super(
          key: key,
          centerTitle: true,
          expandedHeight: height,
          floating: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // leading: IconButton(
          //   padding: EdgeInsets.symmetric(horizontal: mainAppbarPadding),
          //   onPressed: () {},
          //   icon: Icon(Icons.arrow_back, color: Colors.black),
          // ),
          // actions: [
          //   IconButton(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: mainAppbarPadding),
          //     icon: const Icon(Icons.favorite_border_outlined,
          //         color: Colors.black),
          //     onPressed: () {},
          //   ),
          // ],
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final safeAreaTop = MediaQuery.of(context).padding.top;
              final minHeight = safeAreaTop + kToolbarHeight;
              final maxHeight = height + safeAreaTop;

              final percent =
                  (constraints.maxHeight - minHeight) / (maxHeight - minHeight);

              final currentTextStyle = _textStyle.copyWith(
                fontSize: _textStyle.fontSize! +
                    (expandedFontSize - _textStyle.fontSize!) * percent,
              );

              final textWidth =
                  getTextSize(context, title, currentTextStyle).width;
              const startX = mainAppbarPadding;
              final endX = MediaQuery.of(context).size.width / 2 -
                  textWidth / 2 -
                  startX;
              final dx = startX + endX - endX * percent;

              return Container(
                color: Colors.white.withOpacity(1 - percent),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight / 3),
                      child: Transform.translate(
                        offset:
                            Offset(dx, constraints.maxHeight - kToolbarHeight),
                        child: Text(
                          title,
                          style: currentTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
}

class MainAppBar extends AppBar {
  MainAppBar({
    Key? key,
    required Widget title,
    required IconData rightIcon,
  }) : super(
          key: key,
          title: title,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: mainAppbarPadding),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: mainAppbarPadding),
              child: Icon(rightIcon),
            ),
          ],
        );
}

Size getTextSize(BuildContext context, String text, TextStyle style) =>
    (TextPainter(
            text: TextSpan(
              text: text,
              style: style,
            ),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;
