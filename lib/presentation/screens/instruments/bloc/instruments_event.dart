import 'package:audeam_mobile/data/models/models.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class InstrumentsEvent {
  const InstrumentsEvent();
}

class InstrumentsSetInstruments extends InstrumentsEvent {
  final Iterable<MusicalInstrument> instruments;
  final bool isFromFirebase;

  const InstrumentsSetInstruments({
    required this.instruments,
    this.isFromFirebase = true,
  });
}
