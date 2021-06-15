import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_all_pokemons.dart';
import 'pokemon_list_state.dart';

@singleton
class PokemonListCubit extends Cubit<PokemonListState> {
  final GetAllPokemons _getAllPokemons;

  PokemonListCubit(this._getAllPokemons)
      : super(const PokemonListState(list: [], isLoading: true));

  Future<void> loadList() async {
    final list = [...state.list];
    final newList = await _getAllPokemons(lastId: list.length);
    list.addAll(newList);
    emit(state.copyWith(list: list, isLoading: newList.isNotEmpty));
  }
}
