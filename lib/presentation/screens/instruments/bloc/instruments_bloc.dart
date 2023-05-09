import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/models/models.dart';
import 'package:audeam_mobile/data/repositories/musical_instrument_repository.dart';
import 'package:audeam_mobile/presentation/screens/instruments/bloc/instruments_event.dart';
import 'package:audeam_mobile/presentation/screens/instruments/bloc/instruments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstrumentsBloc extends Bloc<InstrumentsEvent, InstrumentsState> {
  final _repo = MusicalInstrumentRepository();

  InstrumentsBloc() : super(const InstrumentsState()) {
    on<InstrumentsGetInstruments>(_getInstruments);
    on<InstrumentsDeleteOneInstrument>(_deleteOneInstrument);
    on<InstrumentsDeleteAllInstrument>(_deleteAllInstrument);
  }

  void _getInstruments(
    InstrumentsGetInstruments event,
    Emitter<InstrumentsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      Iterable<MusicalInstrument> instruments = List.empty();

      instruments = event.isFromFirebase
          ? await _repo.findAll()
          : await _repo.findAllLocal();

      emit(state.copyWith(
        status: Status.success,
        instruments: instruments.toList().reversed,
        isFromFirebase: event.isFromFirebase,
      ));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _deleteOneInstrument(
    InstrumentsDeleteOneInstrument event,
    Emitter<InstrumentsState> emit,
  ) async {
    await _repo.deleteOneInLocal(event.id);
    final instruments = await _repo.findAllLocal();
    emit(state.copyWith(instruments: instruments));
  }

  void _deleteAllInstrument(
    InstrumentsDeleteAllInstrument event,
    Emitter<InstrumentsState> emit,
  ) async {
    await _repo.deleteAllInLocal();
    final instruments = await _repo.findAllLocal();
    emit(state.copyWith(instruments: instruments));
  }
}
