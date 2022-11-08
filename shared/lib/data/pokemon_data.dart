import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../entities/pokemon_type.dart';

part 'pokemon_data.g.dart';

@HiveType(typeId: 0)
class PokemonData extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final PokemonType primaryType;

  @HiveField(4)
  final PokemonType? secondaryType;

  @HiveField(5)
  final int? baseExperience;

  @HiveField(6)
  final int? height;

  @HiveField(7)
  final int? weight;

  const PokemonData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.primaryType,
    required this.secondaryType,
    required this.baseExperience,
    required this.height,
    required this.weight,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        primaryType,
        secondaryType,
        baseExperience,
        height,
        weight,
      ];
}
