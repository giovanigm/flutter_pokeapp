import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_all_pokemons.dart';
import 'pokemon_list_state.dart';

@singleton
class PokemonListCubit extends Cubit<PokemonListState> {
  final GetAllPokemons _getAllPokemons;

  PokemonListCubit(this._getAllPokemons) : super(PokemonListState.initial());

  Future<void> loadList() async {
    if (!state.isLoading) {
      emit(state.copyWith(
        isLoading: true,
        errorMessage: null,
      ));
    }
    final result = await _getAllPokemons();

    result.when(
      success: (pokemonList) {
        emit(state.copyWith(
          list: pokemonList ?? [],
          isLoading: false,
        ));
      },
      error: (_) {
        emit(state.copyWith(
          errorMessage: "It was not possible to fetch the pokemon list\n:(",
          isLoading: false,
        ));
      },
    );
  }
}
