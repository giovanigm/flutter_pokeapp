import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokeapp/app/list/pokemon_list_state.dart';
import 'package:pokeapp/domain/usecases/get_all_pokemons.dart';

@singleton
class PokemonListCubit extends Cubit<PokemonListState> {
  final GetAllPokemons _getAllPokemons;

  PokemonListCubit(this._getAllPokemons)
      : super(PokemonListState(list: [], isLoading: false));

  Future<void> loadList() async {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true));
      final list = state.list;
      final newList = await _getAllPokemons(lastId: list.length);
      list.addAll(newList);
      emit(state.copyWith(list: list, isLoading: false));
    }
  }
}
