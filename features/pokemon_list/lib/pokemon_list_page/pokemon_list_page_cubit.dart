import 'package:feature_commons/feature_commons.dart';

import 'pokemon_list_page_model.dart';
import 'pokemon_list_page_state.dart';

class PokemonListPageCubit extends Cubit<PokemonListPageState> {
  final PokemonListPageModel _model;

  PokemonListPageCubit(this._model) : super(PokemonListPageState.initial());

  Future<void> loadPokemons() async {
    if (!state.isLoading) {
      emit(state.copyWith(
        isLoading: true,
        errorOccurred: false,
      ));
    }

    try {
      final pokemons = await _model.loadPokemons();
      emit(state.copyWith(
        pokemons: pokemons,
        isLoading: false,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorOccurred: true,
        isLoading: false,
      ));
    }
  }
}
