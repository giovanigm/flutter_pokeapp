import 'package:injectable/injectable.dart';

import '../core/result.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

@injectable
class GetAllPokemons {
  final PokemonRepository _repository;

  GetAllPokemons(this._repository);

  Future<Result<List<Pokemon>>> call() => _repository.getAllPokemons();
}
