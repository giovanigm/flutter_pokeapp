import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/pokemon.dart';

part 'pokemon_list_state.freezed.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    required List<Pokemon> list,
    required bool isLoading,
    String? errorMessage,
  }) = _PokemonListState;

  const PokemonListState._();

  factory PokemonListState.initial() => const PokemonListState(
        list: [],
        isLoading: true,
      );
}
