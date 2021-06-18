import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/pokemon.dart';

part 'pokemon_details_state.freezed.dart';

@freezed
class PokemonDetailsState with _$PokemonDetailsState {
  const factory PokemonDetailsState({
    required Pokemon? pokemon,
    required bool isLoading,
  }) = _PokemonDetailsState;

  const PokemonDetailsState._();

  factory PokemonDetailsState.initial() => const PokemonDetailsState(
        pokemon: null,
        isLoading: true,
      );
}
