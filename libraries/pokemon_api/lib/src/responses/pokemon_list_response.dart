import 'package:json_annotation/json_annotation.dart';

part 'pokemon_list_response.g.dart';

@JsonSerializable()
class PokemonListResponse {
  final Data data;

  PokemonListResponse(this.data);

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);
}

@JsonSerializable()
class Data {
  final List<PokemonResponse> pokemon;

  Data(this.pokemon);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class PokemonResponse {
  final int id;
  final int? height;
  final int? weight;

  @JsonKey(name: "base_experience")
  final int? baseExperience;

  final Species species;

  final List<Type> types;

  PokemonResponse(this.id, this.height, this.weight, this.baseExperience,
      this.species, this.types);

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}

@JsonSerializable()
class Species {
  final String name;

  Species(this.name);

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}

@JsonSerializable()
class Type {
  final TypeName type;

  Type(this.type);

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class TypeName {
  final String name;

  TypeName(this.name);

  factory TypeName.fromJson(Map<String, dynamic> json) =>
      _$TypeNameFromJson(json);

  Map<String, dynamic> toJson() => _$TypeNameToJson(this);
}
