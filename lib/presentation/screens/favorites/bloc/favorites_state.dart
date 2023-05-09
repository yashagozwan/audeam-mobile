import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(Status.initial) Status status,
    @Default([]) Iterable<MusicalInstrument> instruments,
  }) = _FavoritesState;
}
