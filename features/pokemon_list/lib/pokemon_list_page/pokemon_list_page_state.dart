import 'package:feature_commons/feature_commons.dart';
import 'package:shared/entities/pokemon.dart';

class PokemonListPageState with EquatableMixin {
  final List<Pokemon> pokemons;
  final bool isLoading;
  final bool errorOccurred;

  const PokemonListPageState({
    required this.pokemons,
    required this.isLoading,
    required this.errorOccurred,
  });

  factory PokemonListPageState.initial() => const PokemonListPageState(
        pokemons: [],
        isLoading: true,
        errorOccurred: false,
      );

  PokemonListPageState copyWith({
    List<Pokemon>? pokemons,
    bool? isLoading,
    bool? errorOccurred,
  }) =>
      PokemonListPageState(
        pokemons: pokemons ?? this.pokemons,
        isLoading: isLoading ?? this.isLoading,
        errorOccurred: errorOccurred ?? this.errorOccurred,
      );

  @override
  List<Object?> get props => [
        pokemons,
        isLoading,
        errorOccurred,
      ];
}
