import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteProvider {
  static Database? _database;

  SqliteProvider._instance();

  Future<Database> get database async {
    const dbName = 'my_database.db';
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path + dbName;
    final db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE history(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        image TEXT
      )
    ''');
  }
}
