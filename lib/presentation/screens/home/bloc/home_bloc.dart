import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/repositories/repositories.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = MusicalInstrumentRepository();

  HomeBloc() : super(const HomeState()) {
    on<HomeReset>(_reset);
    on<HomeStarted>(_started);
  }

  void _reset(
    HomeReset event,
    Emitter<HomeState> emit,
  ) async =>
      emit(const HomeState());

  void _started(
    HomeStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final instruments = await _repository.findAll();
      final histories = await _repository.findAllLocal();

      emit(state.copyWith(
        status: Status.success,
        instruments: instruments,
        histories: histories,
      ));
    } on FirebaseException {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
