import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';

part 'pokemon_list_state.freezed.dart';

@freezed
abstract class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    @required List<Pokemon> list,
    @required bool isLoading,
  }) = _PokemonListState;
}
