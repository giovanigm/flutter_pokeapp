// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonInfoResponse _$PokemonInfoResponseFromJson(Map<String, dynamic> json) {
  return PokemonInfoResponse(
    json['id'] as int,
    json['base_experience'] as int,
    json['height'] as int,
    json['weight'] as int,
    (json['types'] as List<dynamic>)
        .map((e) => TypeData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PokemonInfoResponseToJson(
        PokemonInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
    };

TypeData _$TypeDataFromJson(Map<String, dynamic> json) {
  return TypeData(
    InnerTypeData.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TypeDataToJson(TypeData instance) => <String, dynamic>{
      'type': instance.type,
    };

InnerTypeData _$InnerTypeDataFromJson(Map<String, dynamic> json) {
  return InnerTypeData(
    json['name'] as String,
  );
}

Map<String, dynamic> _$InnerTypeDataToJson(InnerTypeData instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
