import 'package:audeam_mobile/presentation/screens/recognizing/bloc/recognizing_event.dart';
import 'package:audeam_mobile/presentation/screens/recognizing/bloc/recognizing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecognizingBloc extends Bloc<RecognizingEvent, RecognizingState> {
  RecognizingBloc() : super(const RecognizingState()) {
    on<RecognizingReset>(_reset);
    on<RecognizingSetIsRecording>(_setIsRecording);
    on<RecognizingSetResult>(_setResult);
  }

  void _reset(
    RecognizingReset event,
    Emitter<RecognizingState> emit,
  ) =>
      emit(const RecognizingState());

  void _setIsRecording(
    RecognizingSetIsRecording event,
    Emitter<RecognizingState> emit,
  ) =>
      emit(state.copyWith(isRecording: event.isRecognizing));

  void _setResult(
    RecognizingSetResult event,
    Emitter<RecognizingState> emit,
  ) =>
      emit(state.copyWith(result: event.result));
}
