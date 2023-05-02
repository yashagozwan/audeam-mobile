import 'package:freezed_annotation/freezed_annotation.dart';

part 'musical_instrument.freezed.dart';

part 'musical_instrument.g.dart';

@freezed
class MusicalInstrument with _$MusicalInstrument {
  const factory MusicalInstrument({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @Default('') String image,
  }) = _MusicalInstrument;
  factory MusicalInstrument.fromJson(Map<String, dynamic> json) =>
      _$MusicalInstrumentFromJson(json);
}
