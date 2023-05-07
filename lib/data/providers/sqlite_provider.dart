import 'package:audeam_mobile/data/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class SqliteProvider {
  static const histories = 'histories';

  static SqliteProvider? _sqliteProvider;

  SqliteProvider._instance();

  factory SqliteProvider() => _sqliteProvider ??= SqliteProvider._instance();

  Future<Database> get _database async {
    final directory = path.join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(directory, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $histories(
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
    final instruments = await db.query(histories);
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
}
