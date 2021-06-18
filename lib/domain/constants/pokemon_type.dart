import '../../common/string_extensions.dart';

enum PokemonType {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water,
  undefined,
}

extension PokemonTypeX on PokemonType {
  String get name =>
      toString().substring(toString().indexOf('.') + 1).capitalize();

  String get value => name.toLowerCase();

  static PokemonType fromValue(String value) {
    for (final PokemonType type in PokemonType.values) {
      if (value == type.value) return type;
    }
    return PokemonType.undefined;
  }
}
