import 'package:injectable/injectable.dart';
import 'package:pokeapp/domain/entities/pokemon.dart';
import 'package:pokeapp/domain/repositories/pokemon_repository.dart';

@injectable
class GetAllPokemons {
  final PokemonRepository _repository;

  GetAllPokemons(this._repository);

  Future<List<Pokemon>> call({int lastId}) =>
      _repository.getAllPokemons(lastId: lastId);
}
