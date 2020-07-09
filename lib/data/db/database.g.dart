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

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

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
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
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
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PokemonDao _pokemonDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Pokemons` (`id` INTEGER, `name` TEXT, `imageUrl` TEXT, `baseExperience` INTEGER, `height` INTEGER, `weight` INTEGER, `types` TEXT, PRIMARY KEY (`id`))');

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
            (PokemonData item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'baseExperience': item.baseExperience,
                  'height': item.height,
                  'weight': item.weight,
                  'types': item.types
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _pokemonsMapper = (Map<String, dynamic> row) => PokemonData(
      id: row['id'] as int,
      name: row['name'] as String,
      imageUrl: row['imageUrl'] as String,
      baseExperience: row['baseExperience'] as int,
      height: row['height'] as int,
      weight: row['weight'] as int,
      types: row['types'] as String);

  final InsertionAdapter<PokemonData> _pokemonDataInsertionAdapter;

  @override
  Future<List<PokemonData>> getAllPokemons(int limit, int offset) async {
    return _queryAdapter.queryList('SELECT * FROM Pokemons LIMIT ? OFFSET ?',
        arguments: <dynamic>[limit, offset], mapper: _pokemonsMapper);
  }

  @override
  Future<void> insertAll(List<PokemonData> pokemons) async {
    await _pokemonDataInsertionAdapter.insertList(
        pokemons, OnConflictStrategy.replace);
  }
}
