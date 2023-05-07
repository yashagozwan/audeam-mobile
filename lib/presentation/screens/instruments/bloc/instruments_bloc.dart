import 'package:audeam_mobile/presentation/screens/instruments/bloc/instruments_event.dart';
import 'package:audeam_mobile/presentation/screens/instruments/bloc/instruments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstrumentsBloc extends Bloc<InstrumentsEvent, InstrumentsState> {
  InstrumentsBloc() : super(const InstrumentsState()) {
    on<InstrumentsSetInstruments>(_setInstruments);
  }

  void _setInstruments(
    InstrumentsSetInstruments event,
    Emitter<InstrumentsState> emit,
  ) =>
      emit(state.copyWith(
        instruments: event.instruments,
        isFromFirebase: event.isFromFirebase,
      ));
}
