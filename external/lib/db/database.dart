import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../model/pokemon_dto.dart';
import 'converters/pokemon_type_converters.dart';
import 'pokemon_dao.dart';

part 'database.g.dart';

@TypeConverters([
  PokemonTypeConverter,
  NullablePokemonTypeConverter,
])
@Database(version: 1, entities: [PokemonDTO])
abstract class AppDatabase extends FloorDatabase {
  PokemonDao get pokemonDao;

  static const databaseName = "app_database.db";
}
