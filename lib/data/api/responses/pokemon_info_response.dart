import 'package:json_annotation/json_annotation.dart';

part 'pokemon_info_response.g.dart';

@JsonSerializable()
class PokemonInfoResponse {
  final int id;

  @JsonKey(name: "base_experience")
  final int baseExperience;

  final int height;
  final int weight;
  final List<TypeData> types;

  PokemonInfoResponse(
      this.id, this.baseExperience, this.height, this.weight, this.types);

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonInfoResponseToJson(this);
}

@JsonSerializable()
class TypeData {
  final InnerTypeData type;

  TypeData(this.type);

  factory TypeData.fromJson(Map<String, dynamic> json) =>
      _$TypeDataFromJson(json);
  Map<String, dynamic> toJson() => _$TypeDataToJson(this);
}

@JsonSerializable()
class InnerTypeData {
  final String name;

  InnerTypeData(this.name);

  factory InnerTypeData.fromJson(Map<String, dynamic> json) =>
      _$InnerTypeDataFromJson(json);
  Map<String, dynamic> toJson() => _$InnerTypeDataToJson(this);
}
