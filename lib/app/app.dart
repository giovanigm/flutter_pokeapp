import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapp/app/list/pokemon_list_cubit.dart';
import 'package:pokeapp/app/list/pokemon_list_page.dart';

import '../injection.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonListCubit>(
      create: (context) => getIt<PokemonListCubit>(),
      child: MaterialApp(
          title: 'PokeApp',
          debugShowCheckedModeBanner: false,
          home: PokemonListPage(),
          theme: ThemeData(
            fontFamily: "CircularStd",
            brightness: Brightness.light,
            primaryColor: Colors.red,
            accentColor: Colors.red,
          )),
    );
  }
}
