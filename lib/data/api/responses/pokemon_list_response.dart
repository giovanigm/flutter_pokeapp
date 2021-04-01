import 'package:json_annotation/json_annotation.dart';

import '../../model/pokemon_data.dart';

part 'pokemon_list_response.g.dart';

@JsonSerializable()
class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonItem> results;

  PokemonListResponse(this.count, this.next, this.previous, this.results);

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);
}

@JsonSerializable()
class PokemonItem {
  final String name;
  final String url;

  PokemonItem({required this.name, required this.url});

  PokemonData toPokemonData() {
    var values = url.split("/");
    values.removeLast();
    int id = int.parse(values.last);

    return PokemonData(
      id: id,
      name: name[0].toUpperCase() + name.substring(1),
      imageUrl: "https://pokeres.bastionbot.org/images/pokemon/$id.png",
      baseExperience: null,
      height: null,
      weight: null,
      primaryType: null,
      secondaryType: null,
    );
  }

  factory PokemonItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonItemFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonItemToJson(this);
}
