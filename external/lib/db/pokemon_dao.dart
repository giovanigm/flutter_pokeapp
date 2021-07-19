import 'package:floor/floor.dart';

import '../model/pokemon_dto.dart';

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM Pokemons')
  Future<List<PokemonDTO>> getAllPokemons();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAll(List<PokemonDTO> pokemons);
}
