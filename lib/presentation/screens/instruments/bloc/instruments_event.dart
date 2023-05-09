import 'package:audeam_mobile/data/models/models.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class InstrumentsEvent {
  const InstrumentsEvent();
}

class InstrumentsGetInstruments extends InstrumentsEvent {
  final Iterable<MusicalInstrument> instruments;
  final bool isFromFirebase;

  const InstrumentsGetInstruments({
    required this.instruments,
    this.isFromFirebase = true,
  });
}

class InstrumentsDeleteOneInstrument extends InstrumentsEvent {
  final String id;

  const InstrumentsDeleteOneInstrument({
    required this.id,
  });
}

class InstrumentsDeleteAllInstrument extends InstrumentsEvent {
  const InstrumentsDeleteAllInstrument();
}
