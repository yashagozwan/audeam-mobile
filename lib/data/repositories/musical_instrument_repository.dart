import 'package:audeam_mobile/data/models/models.dart';
import 'package:audeam_mobile/data/providers/providers.dart';
import 'package:audeam_mobile/data/providers/sqlite_provider.dart';

class MusicalInstrumentRepository {
  final _instrumentProvider = MusicalInstrumentProvider();
  final _sqliteProvider = SqliteProvider();

  Future<Iterable<MusicalInstrument>> findAll() =>
      _instrumentProvider.findAll();

  Future<Iterable<MusicalInstrument>> findAllLocal() =>
      _sqliteProvider.findAll();

  Future<MusicalInstrument> findByName(String name) =>
      _instrumentProvider.findByName(name);

  Future<int> insertOneToHistory(MusicalInstrument instrument) =>
      _sqliteProvider.insertOne(instrument);
}
