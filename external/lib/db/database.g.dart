// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PokemonDao? _pokemonDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Pokemons` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `image_url` TEXT NOT NULL, `base_experience` INTEGER NOT NULL, `height` INTEGER NOT NULL, `weight` INTEGER NOT NULL, `primary_type` TEXT NOT NULL, `secondary_type` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PokemonDao get pokemonDao {
    return _pokemonDaoInstance ??= _$PokemonDao(database, changeListener);
  }
}

class _$PokemonDao extends PokemonDao {
  _$PokemonDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _pokemonDataInsertionAdapter = InsertionAdapter(
            database,
            'Pokemons',
            (PokemonData item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image_url': item.imageUrl,
                  'base_experience': item.baseExperience,
                  'height': item.height,
                  'weight': item.weight,
                  'primary_type':
                      _pokemonTypeConverter.encode(item.primaryType),
                  'secondary_type':
                      _nullablePokemonTypeConverter.encode(item.secondaryType)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PokemonData> _pokemonDataInsertionAdapter;

  @override
  Future<List<PokemonData>> getAllPokemons() async {
    return _queryAdapter.queryList('SELECT * FROM Pokemons',
        mapper: (Map<String, Object?> row) => PokemonData(
            id: row['id'] as int,
            name: row['name'] as String,
            imageUrl: row['image_url'] as String,
            baseExperience: row['base_experience'] as int,
            height: row['height'] as int,
            weight: row['weight'] as int,
            primaryType:
                _pokemonTypeConverter.decode(row['primary_type'] as String),
            secondaryType: _nullablePokemonTypeConverter
                .decode(row['secondary_type'] as String?)));
  }

  @override
  Future<void> insertAll(List<PokemonData> pokemons) async {
    await _pokemonDataInsertionAdapter.insertList(
        pokemons, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _pokemonTypeConverter = PokemonTypeConverter();
final _nullablePokemonTypeConverter = NullablePokemonTypeConverter();
