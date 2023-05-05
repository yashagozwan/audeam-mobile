import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/models/musical_instrument/musical_instrument.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_state.freezed.dart';

part 'detail_state.g.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState({
    @Default(Status.initial) Status status,
    @Default(MusicalInstrument()) MusicalInstrument instrument,
  }) = _DetailState;

  factory DetailState.fromJson(Map<String, dynamic> json) =>
      _$DetailStateFromJson(json);
}
