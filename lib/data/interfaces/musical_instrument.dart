import 'package:audeam_mobile/data/models/musical_instrument_model.dart';

abstract class MusicalInstrument {
  Future<MusicalInstrumentModel?> findOne(String query);
}
