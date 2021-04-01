import 'package:floor/floor.dart';

import '../model/pokemon_data.dart';

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM Pokemons LIMIT :limit OFFSET :offset')
  Future<List<PokemonData>> getAllPokemons(int limit, int offset);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<PokemonData> pokemons);
}
