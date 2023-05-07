import 'package:freezed_annotation/freezed_annotation.dart';

part 'recognizing_state.freezed.dart';

@freezed
class RecognizingState with _$RecognizingState {
  const factory RecognizingState({
    @Default(false) bool isRecording,
    Stream<Map<dynamic, dynamic>>? result,
  }) = _RecognizingState;
}
