import 'package:domain/constants/pokemon_type.dart';
import 'package:floor/floor.dart';

class PokemonTypeConverter extends TypeConverter<PokemonType, String> {
  @override
  PokemonType decode(String databasePokemonType) =>
      PokemonTypeX.fromValue(databasePokemonType);

  @override
  String encode(PokemonType pokemonType) => pokemonType.value;
}

class NullablePokemonTypeConverter
    extends TypeConverter<PokemonType?, String?> {
  @override
  PokemonType? decode(String? databasePokemonType) =>
      databasePokemonType != null
          ? PokemonTypeX.fromValue(databasePokemonType)
          : null;

  @override
  String? encode(PokemonType? pokemonType) => pokemonType?.value;
}
