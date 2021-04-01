import 'package:floor/floor.dart';

import '../../../domain/constants/pokemon_type.dart';

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
  PokemonType decode(String? databasePokemonType) =>
      PokemonTypeX.fromValue(databasePokemonType ?? "");

  @override
  String? encode(PokemonType? pokemonType) => pokemonType?.value;
}
