import 'package:audeam_mobile/core/constants/status.dart';
import 'package:audeam_mobile/data/models/musical_instrument_model.dart';
import 'package:flutter/material.dart';

@immutable
class MusicalInstrumentState {
  final Status status;
  final MusicalInstrumentModel? instrument;

  const MusicalInstrumentState({
    this.status = Status.initial,
    this.instrument,
  });

  MusicalInstrumentState copyWith({
    Status? status,
    MusicalInstrumentModel? instrument,
  }) {
    return MusicalInstrumentState(
      status: status ?? this.status,
      instrument: instrument ?? this.instrument,
    );
  }
}
