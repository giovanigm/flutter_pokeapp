import 'dart:async';
import 'package:floor/floor.dart';
import 'package:pokeapp/data/db/pokemon_dao.dart';
import 'package:pokeapp/data/model/pokemon_data.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [PokemonData])
abstract class AppDatabase extends FloorDatabase {
  PokemonDao get pokemonDao;

  static const DATABASE_NAME = "app_database.db";
}
