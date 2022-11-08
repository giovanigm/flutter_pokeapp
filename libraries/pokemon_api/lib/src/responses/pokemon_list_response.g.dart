// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) =>
    PokemonListResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonListResponseToJson(
        PokemonListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['pokemon'] as List<dynamic>)
          .map((e) => PokemonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'pokemon': instance.pokemon,
    };

PokemonResponse _$PokemonResponseFromJson(Map<String, dynamic> json) =>
    PokemonResponse(
      json['id'] as int,
      json['height'] as int?,
      json['weight'] as int?,
      json['base_experience'] as int?,
      Species.fromJson(json['species'] as Map<String, dynamic>),
      (json['types'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonResponseToJson(PokemonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'height': instance.height,
      'weight': instance.weight,
      'base_experience': instance.baseExperience,
      'species': instance.species,
      'types': instance.types,
    };

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      json['name'] as String,
    );

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      'name': instance.name,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      TypeName.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'type': instance.type,
    };

TypeName _$TypeNameFromJson(Map<String, dynamic> json) => TypeName(
      json['name'] as String,
    );

Map<String, dynamic> _$TypeNameToJson(TypeName instance) => <String, dynamic>{
      'name': instance.name,
    };
