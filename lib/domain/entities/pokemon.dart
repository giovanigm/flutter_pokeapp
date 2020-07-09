import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pokemon.freezed.dart';

@freezed
abstract class Pokemon with _$Pokemon {
  const factory Pokemon(
      {@required int id,
      @required String name,
      @required String imageUrl,
      int baseExperience,
      int height,
      int weight,
      List<String> types}) = _Pokemon;
}
