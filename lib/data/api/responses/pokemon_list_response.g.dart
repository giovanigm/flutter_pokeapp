// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) {
  return PokemonListResponse(
    _Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokemonListResponseToJson(
        PokemonListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_Data _$_DataFromJson(Map<String, dynamic> json) {
  return _Data(
    (json['pokemon'] as List<dynamic>)
        .map((e) => _PokemonItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_DataToJson(_Data instance) => <String, dynamic>{
      'pokemon': instance.pokemon,
    };

_PokemonItem _$_PokemonItemFromJson(Map<String, dynamic> json) {
  return _PokemonItem(
    json['id'] as int,
    json['height'] as int,
    json['weight'] as int,
    json['base_experience'] as int,
    _Species.fromJson(json['species'] as Map<String, dynamic>),
    (json['types'] as List<dynamic>)
        .map((e) => _Type.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_PokemonItemToJson(_PokemonItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'height': instance.height,
      'weight': instance.weight,
      'base_experience': instance.baseExperience,
      'species': instance.species,
      'types': instance.types,
    };

_Species _$_SpeciesFromJson(Map<String, dynamic> json) {
  return _Species(
    json['name'] as String,
  );
}

Map<String, dynamic> _$_SpeciesToJson(_Species instance) => <String, dynamic>{
      'name': instance.name,
    };

_Type _$_TypeFromJson(Map<String, dynamic> json) {
  return _Type(
    _TypeName.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_TypeToJson(_Type instance) => <String, dynamic>{
      'type': instance.type,
    };

_TypeName _$_TypeNameFromJson(Map<String, dynamic> json) {
  return _TypeName(
    json['name'] as String,
  );
}

Map<String, dynamic> _$_TypeNameToJson(_TypeName instance) => <String, dynamic>{
      'name': instance.name,
    };
