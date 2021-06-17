import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/pokemon.dart';

class PokemonDetailsPage extends StatelessWidget {
  final Pokemon pokemon;
  final Color backgroundColor;

  const PokemonDetailsPage({
    required this.pokemon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "card-${pokemon.id}",
      child: Scaffold(
        body: Container(
          color: backgroundColor,
          child: DefaultTabController(
            length: 4,
            child: Container(
              color: Colors.transparent,
              child: NestedScrollView(
                headerSliverBuilder: (
                  BuildContext context,
                  bool innerBoxIsScrolled,
                ) {
                  return [
                    SliverAppBar(
                      elevation: 0,
                      backgroundColor: backgroundColor,
                      expandedHeight: 300.0,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(pokemon.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          background: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: CachedNetworkImage(
                              imageUrl: pokemon.imageUrl,
                            ),
                          )),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                          labelColor: Colors.black87,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.blue[800],
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(text: "About"),
                            Tab(text: "Base Stats"),
                            Tab(text: "Evolution"),
                            Tab(text: "Moves"),
                          ],
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: ClipRect(
                  clipper: _TabBarClipper(
                      clipHeight: MediaQuery.of(context).size.height - 100),
                  child: Container(
                    color: Colors.white,
                    child: const TabBarView(
                      children: <Widget>[
                        Center(
                          child: Text("About"),
                        ),
                        Center(
                          child: Text("Base stats"),
                        ),
                        Center(
                          child: Text("Evolution"),
                        ),
                        Center(
                          child: Text("Moves"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarClipper extends CustomClipper<Rect> {
  final double clipHeight;

  _TabBarClipper({required this.clipHeight});

  @override
  Rect getClip(Size size) {
    final double top = max(size.height - clipHeight, 0);
    final rect = Rect.fromLTRB(0.0, top, size.width, size.height);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
