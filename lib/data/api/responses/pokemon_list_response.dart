import 'package:json_annotation/json_annotation.dart';
import 'package:pokeapp/common/string_extensions.dart';
import 'package:pokeapp/domain/constants/pokemon_type.dart';

import '../../model/pokemon_data.dart';

part 'pokemon_list_response.g.dart';

@JsonSerializable()
class PokemonListResponse {
  final _Data data;

  PokemonListResponse(this.data);

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);
}

@JsonSerializable()
class _Data {
  final List<_PokemonItem> pokemon;

  _Data(this.pokemon);

  factory _Data.fromJson(Map<String, dynamic> json) => _$_DataFromJson(json);

  Map<String, dynamic> toJson() => _$_DataToJson(this);
}

@JsonSerializable()
class _PokemonItem {
  final int id;
  final int height;
  final int weight;

  @JsonKey(name: "base_experience")
  final int baseExperience;

  final _Species species;

  final List<_Type> types;

  _PokemonItem(this.id, this.height, this.weight, this.baseExperience,
      this.species, this.types);

  PokemonData toPokemonData() {
    final primaryType = PokemonTypeX.fromValue(types[0].type.name);
    PokemonType? secondaryType;
    if (types.length == 2) {
      secondaryType = PokemonTypeX.fromValue(types[1].type.name);
    }

    return PokemonData(
      id: id,
      name: species.name.capitalize(),
      imageUrl:
          "https://assets.pokemon.com/assets/cms2/img/pokedex/full/${id.toString().padLeft(3, '0')}.png",
      baseExperience: baseExperience,
      height: height,
      weight: weight,
      primaryType: primaryType,
      secondaryType: secondaryType,
    );
  }

  factory _PokemonItem.fromJson(Map<String, dynamic> json) =>
      _$_PokemonItemFromJson(json);

  Map<String, dynamic> toJson() => _$_PokemonItemToJson(this);
}

@JsonSerializable()
class _Species {
  final String name;

  _Species(this.name);

  factory _Species.fromJson(Map<String, dynamic> json) =>
      _$_SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$_SpeciesToJson(this);
}

@JsonSerializable()
class _Type {
  final _TypeName type;

  _Type(this.type);

  factory _Type.fromJson(Map<String, dynamic> json) => _$_TypeFromJson(json);

  Map<String, dynamic> toJson() => _$_TypeToJson(this);
}

@JsonSerializable()
class _TypeName {
  final String name;

  _TypeName(this.name);

  factory _TypeName.fromJson(Map<String, dynamic> json) =>
      _$_TypeNameFromJson(json);

  Map<String, dynamic> toJson() => _$_TypeNameToJson(this);
}
