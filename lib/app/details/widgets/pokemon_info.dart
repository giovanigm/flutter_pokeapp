import 'package:flutter/material.dart';

class PokemonInfo extends StatelessWidget {
  final AnimationController sliderController;

  const PokemonInfo({
    Key? key,
    required this.sliderController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedBuilder(
              animation: sliderController,
              builder: (context, child) => SizedBox(
                height: (1 - sliderController.value) * 30 + 6,
              ),
            ),
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.indigo,
              tabs: [
                Tab(text: "About"),
                Tab(text: "Base Stats"),
                Tab(text: "Evolution"),
                Tab(text: "Moves"),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text("About"),
                  ),
                  Center(
                    child: Text("Base Stats"),
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
          ],
        ),
      ),
    );
  }
}
