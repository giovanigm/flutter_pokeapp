// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) {
  return PokemonListResponse(
    json['count'] as int,
    json['next'] as String?,
    json['previous'] as String?,
    (json['results'] as List<dynamic>)
        .map((e) => PokemonItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PokemonListResponseToJson(
        PokemonListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

PokemonItem _$PokemonItemFromJson(Map<String, dynamic> json) {
  return PokemonItem(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$PokemonItemToJson(PokemonItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
