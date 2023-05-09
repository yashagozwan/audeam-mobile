import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'instruments_state.freezed.dart';

@freezed
class InstrumentsState with _$InstrumentsState {
  const factory InstrumentsState({
    @Default(Status.initial) Status status,
    @Default([]) Iterable<MusicalInstrument> instruments,
    @Default(true) bool isFromFirebase,
  }) = _InstrumentsState;
}
