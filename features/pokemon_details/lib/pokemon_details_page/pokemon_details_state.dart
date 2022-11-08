import 'package:feature_commons/feature_commons.dart';
import 'package:shared/entities/pokemon.dart';

class PokemonDetailsState with EquatableMixin {
  final List<Pokemon> pokemons;
  final Pokemon? selectedPokemon;
  final bool isLoading;

  const PokemonDetailsState({
    required this.pokemons,
    required this.selectedPokemon,
    required this.isLoading,
  });

  factory PokemonDetailsState.initial() => const PokemonDetailsState(
        pokemons: [],
        selectedPokemon: null,
        isLoading: true,
      );

  PokemonDetailsState copyWith({
    List<Pokemon>? pokemons,
    Pokemon? selectedPokemon,
    bool? isLoading,
  }) =>
      PokemonDetailsState(
        pokemons: pokemons ?? this.pokemons,
        selectedPokemon: selectedPokemon ?? this.selectedPokemon,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [
        pokemons,
        selectedPokemon,
        isLoading,
      ];
}
