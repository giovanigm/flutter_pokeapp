import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokeapp/app/details/pokemon_details_state.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

@injectable
class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit() : super(PokemonDetailsState.initial());

  void init({Pokemon? pokemon}) {
    emit(state.copyWith(pokemon: pokemon));
  }

  void setPokemon(Pokemon pokemon) {
    emit(state.copyWith(pokemon: pokemon));
  }
}
