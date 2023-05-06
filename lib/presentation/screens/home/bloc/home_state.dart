import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.initial) Status status,
    @Default([]) Iterable<MusicalInstrument> instruments,
    @Default([]) Iterable<MusicalInstrument> histories,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
