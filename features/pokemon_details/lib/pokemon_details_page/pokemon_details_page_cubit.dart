import 'package:feature_commons/feature_commons.dart';
import 'package:shared/entities/pokemon.dart';

import 'pokemon_details_page_model.dart';
import 'pokemon_details_state.dart';

class PokemonDetailsPageCubit extends Cubit<PokemonDetailsState> {
  final PokemonDetailsPageModel _model;

  PokemonDetailsPageCubit(this._model) : super(PokemonDetailsState.initial());

  void init(int pokemonId) {
    final pokemons = _model.getAllPokemons();
    final selectedPokemon =
        pokemons.firstWhere((element) => element.id == pokemonId);
    emit(state.copyWith(
      pokemons: pokemons,
      selectedPokemon: selectedPokemon,
    ));
  }

  void setSelectedPokemon(Pokemon pokemon) {
    emit(state.copyWith(selectedPokemon: pokemon));
  }
}
