import 'package:injectable/injectable.dart';
import 'package:pokeapp/app/base/base_view_model.dart';
import 'package:pokeapp/app/list/pokemon_list_state.dart';
import 'package:pokeapp/domain/usecases/get_all_pokemons.dart';

@singleton
class PokemonListViewModel extends BaseViewModel<PokemonListState> {
  final GetAllPokemons _getAllPokemons;

  PokemonListViewModel(this._getAllPokemons)
      : super(PokemonListState(list: [], isLoading: false));

  Future<void> loadList() async {
    if (!state.isLoading) {
      state = state.copyWith(isLoading: true);
      final list = state.list;
      final newList = await _getAllPokemons(lastId: list.length);
      list.addAll(newList);
      state = state.copyWith(list: list, isLoading: false);
    }
  }
}
