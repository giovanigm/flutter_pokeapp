import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/app/base/cubit_page.dart';
import 'package:pokeapp/app/list/pokemon_list_state.dart';
import 'package:pokeapp/app/list/pokemon_list_view_model.dart';
import 'package:pokeapp/app/list/widgets/pokemon_list_item.dart';

class PokemonListPage extends CubitPage<PokemonListCubit> {
  final ScrollController _scrollController = ScrollController();

  @override
  void onInit(BuildContext context, PokemonListCubit cubit) {
    cubit.loadList();
    _scrollController.addListener(() {
      var triggerFetchMoreSize = _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels == triggerFetchMoreSize) {
        cubit.loadList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PokeApp"),
      ),
      body: BlocBuilder<PokemonListCubit, PokemonListState>(
        builder: (context, state) =>
            NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              child: Column(
                children: <Widget>[
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.5),
                      itemCount: state.list.length,
                      itemBuilder: (context, index) => PokemonListItem(
                            key: GlobalKey(),
                            pokemon: state.list[index],
                          )),
                  if (state.isLoading)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(BuildContext context, PokemonListCubit cubit) {
    _scrollController.dispose();
  }
}
