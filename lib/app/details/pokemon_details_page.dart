import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

class PokemonDetailsPage extends StatelessWidget {
  final Pokemon pokemon;
  final Color backgroundColor;

  const PokemonDetailsPage({Key key, this.pokemon, this.backgroundColor})
      : super(key: key);

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
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      elevation: 0,
                      backgroundColor: backgroundColor,
                      expandedHeight: 300.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          collapseMode: CollapseMode.parallax,
                          title: Text(pokemon.name,
                              style: TextStyle(
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
                          tabs: [
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
                body: Container(
                  color: Colors.white,
                  child: TabBarView(children: <Widget>[
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
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
      decoration: BoxDecoration(
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
