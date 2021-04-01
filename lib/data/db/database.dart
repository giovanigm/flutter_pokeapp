import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../model/pokemon_data.dart';
import 'converters/pokemon_type_converters.dart';
import 'pokemon_dao.dart';

part 'database.g.dart';

@TypeConverters([
  PokemonTypeConverter,
  NullablePokemonTypeConverter,
])
@Database(version: 1, entities: [PokemonData])
abstract class AppDatabase extends FloorDatabase {
  PokemonDao get pokemonDao;

  static const DATABASE_NAME = "app_database.db";
}
