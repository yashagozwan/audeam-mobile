import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final _repo = MusicalInstrumentRepository();

  DetailBloc() : super(const DetailState()) {
    on<DetailReset>(_reset);
    on<DetailGetInstrument>(_getInstrumentByName);
  }

  void _reset(
    DetailReset event,
    Emitter<DetailState> emit,
  ) =>
      emit(const DetailState());

  void _getInstrumentByName(
    DetailGetInstrument event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await _repo.findByName(event.name);
      
      emit(state.copyWith(
        status: Status.success,
        instrument: result,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
