import 'package:audeam_mobile/data/models/models.dart';
import 'package:audeam_mobile/data/providers/providers.dart';

class MusicalInstrumentRepository {
  final _provider = MusicalInstrumentProvider();

  Future<Iterable<MusicalInstrument>> findAll() => _provider.findAll();
}
