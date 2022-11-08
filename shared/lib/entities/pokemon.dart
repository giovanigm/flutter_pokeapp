import 'package:equatable/equatable.dart';
import 'package:shared/entities/pokemon_type.dart';

class Pokemon with EquatableMixin {
  final int id;
  final String name;
  final String imageUrl;
  final PokemonType primaryType;
  final PokemonType? secondaryType;
  final int? baseExperience;
  final int? height;
  final int? weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.primaryType,
    required this.secondaryType,
    required this.baseExperience,
    required this.height,
    required this.weight,
  });

  String get number => "#${id.toString().padLeft(3, '0')}";

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
