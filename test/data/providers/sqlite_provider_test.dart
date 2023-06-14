import 'package:audeam_mobile/data/models/models.dart';
import 'package:audeam_mobile/data/providers/sqlite_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('Sqlite Provider - History', () {
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

      await sqliteProvider.insertOne(instrument);
    });

    test('find all instrument', () async {
      final instruments = await sqliteProvider.findAll();
      print(instruments);
    });

    test('test delete one', () async {
      final result = await sqliteProvider.deleteOne('1');
      print(result);
    });

    test('test delete all', () async {
      final result = await sqliteProvider.deleteAll();
      print(result);
    });
  });

  group('Sqlite Provider - Favorite', () {
    late final SqliteProvider sqliteProvider;

    setUpAll(() {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      sqliteProvider = SqliteProvider();
    });

    test('Test Save Favorite', () async {
      const instrument = MusicalInstrument(
        id: '1',
        name: 'Clarinet',
        description: 'Jazz',
        image: 'http://google.com/image.jpg',
      );

      final result = await sqliteProvider.insertOneFavorite(instrument);
      print(result);
    });

    test('Test Find All', () async {
      final favorites = await sqliteProvider.findAllFavorite();
      print(favorites);
    });

    test('Test Delete One', () async {
      const favoriteId = '4';
      final result = await sqliteProvider.deleteOneFavorite(favoriteId);
      print(result);
    });

    test('Test Delete All', () async {
      final result = await sqliteProvider.deleteFavorites();
      print(result);
    });
  });
}
