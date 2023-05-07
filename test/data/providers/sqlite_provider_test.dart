import 'package:audeam_mobile/data/models/models.dart';
import 'package:audeam_mobile/data/providers/sqlite_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('Sqlite Provider', () {
    late final SqliteProvider sqliteProvider;

    setUpAll(() {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      sqliteProvider = SqliteProvider();
    });

    test('save instrument', () async {
      const instrument = MusicalInstrument(
        name: 'Guitar',
        description: 'this cool Guitar',
        image: 'http://google.com/image.jpg',
      );

      final result = await sqliteProvider.insertOne(instrument);
      print(result);
    });

    test('find all instrument', () async {
      final instruments = await sqliteProvider.findAll();
      print(instruments);
    });

    test('test delete one', () async {
      final result = await sqliteProvider.deleteOne('1');
      print(result);
    });
  });
}
