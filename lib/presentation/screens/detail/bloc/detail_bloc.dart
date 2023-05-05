import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(const DetailState()) {
    on<DetailReset>(_reset);
  }

  void _reset(
    DetailReset event,
    Emitter<DetailState> emit,
  ) =>
      emit(const DetailState());
}
