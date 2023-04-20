import 'package:audeam_mobile/core/constants/status.dart';
import 'package:audeam_mobile/core/cubit/musical_instrument/musical_instrument_state.dart';
import 'package:audeam_mobile/data/repositories/musical_instrument_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicalInstrumentCubit extends Cubit<MusicalInstrumentState> {
  final _musicalInstrumentRepository = MusicalInstrumentRepository();

  MusicalInstrumentCubit() : super(const MusicalInstrumentState());

  void reset() => emit(const MusicalInstrumentState());

  Future<void> findOne(String query) async {
    emit(state.copyWith(
      status: Status.loading,
    ));
    try {
      final result = await _musicalInstrumentRepository.findOne(query);
      print(result);
      emit(state.copyWith(
        status: Status.success,
        instrument: result,
      ));
    } on FirebaseException {
      emit(state.copyWith(
        status: Status.failure,
      ));
    }
  }
}
