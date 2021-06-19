import 'package:floor/floor.dart';

import '../model/pokemon_data.dart';

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM Pokemons')
  Future<List<PokemonData>> getAllPokemons();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<PokemonData> pokemons);
}
