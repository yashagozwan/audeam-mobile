import 'package:audeam_mobile/data/interfaces/musical_instrument.dart';
import 'package:audeam_mobile/data/models/musical_instrument_model.dart';
import 'package:audeam_mobile/data/providers/musica_instrumentl_provider.dart';

class MusicalInstrumentRepository implements MusicalInstrument {
  final _musicalInstrumentProvider = MusicalInstrumentProvider();

  @override
  Future<MusicalInstrumentModel?> findOne(String query) =>
      _musicalInstrumentProvider.findOne(query);
}
