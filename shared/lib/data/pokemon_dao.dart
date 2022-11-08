import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared/data/pokemon_data.dart';

class PokemonDao {
  final Box<PokemonData> _box;

  PokemonDao._(this._box);

  static Future<PokemonDao> init() async {
    final box = await Hive.openBox<PokemonData>("pokemons");
    return PokemonDao._(box);
  }

  List<PokemonData> getAllPokemons() {
    final List<PokemonData> pokemons = _box.values.toList();

    return pokemons;
  }

  Future<PokemonData?> getPokemonById(int id) async {
    final List<PokemonData> pokemons = _box.values.toList();

    return pokemons.cast<PokemonData?>().firstWhere(
          (element) => element?.id == id,
          orElse: () => null,
        );
  }

  Future<void> saveAll(List<PokemonData> pokemons) async {
    await _box.addAll(pokemons);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
