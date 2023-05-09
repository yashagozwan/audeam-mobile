import 'package:audeam_mobile/data/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class SqliteProvider {
  static const databaseName = 'audeam_v1.db';
  static const histories = 'histories';
  static const favorites = 'favorites';

  static SqliteProvider? _sqliteProvider;

  SqliteProvider._instance();

  factory SqliteProvider() => _sqliteProvider ??= SqliteProvider._instance();

  Future<Database> get _database async {
    final directory = path.join(await getDatabasesPath(), databaseName);
    return await openDatabase(
      directory,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $histories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        image TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $favorites(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        image TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertOne(MusicalInstrument instrument) async {
    final db = await _database;
    final data = instrument.toJson();
    data.remove('id');
    final result = await db.insert(
      histories,
      data,
      conflictAlgorithm: ConflictAlgorithm.abort,
    );

    return result;
  }

  Future<Iterable<MusicalInstrument>> findAll() async {
    final db = await _database;
    final instruments = await db.query(histories, orderBy: 'id DESC');
    return instruments.map((e) => MusicalInstrument.fromMap(e));
  }

  Future<int> deleteOne(String id) async {
    final db = await _database;
    return await db.delete(
      histories,
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    final db = await _database;
    return await db.delete(histories);
  }

  Future<int> insertOneFavorite(MusicalInstrument instrument) async {
    final db = await _database;
    final data = instrument.toJson();
    data.remove('id');
    return await db.insert(
      favorites,
      data,
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  Future<Iterable<MusicalInstrument>> findAllFavorite() async {
    final db = await _database;
    final favoritesMap = await db.query(favorites, orderBy: 'id DESC');
    return favoritesMap.map((e) => MusicalInstrument.fromMap(e));
  }

  Future<int> deleteOneFavorite(String name) async {
    final db = await _database;
    return await db.delete(favorites, where: 'name=?', whereArgs: [name]);
  }

  Future<int> deleteFavorites() async {
    final db = await _database;
    return await db.delete(favorites);
  }
}
