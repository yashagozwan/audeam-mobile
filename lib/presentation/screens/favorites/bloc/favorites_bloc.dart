import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/core/utils/utils.dart';
import 'package:audeam_mobile/data/models/models.dart';
import 'package:audeam_mobile/data/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final _repo = MusicalInstrumentRepository();

  final BuildContext context;

  FavoritesBloc(this.context) : super(const FavoritesState()) {
    on<FavoritesStarted>(_started);
    on<FavoritesAddFavorite>(_addFavorite);
    on<FavoritesDeleteFavorite>(_deleteFavorite);
    on<FavoritesDeleteFavorites>(_deleteFavorites);
  }

  void _started(
    FavoritesStarted event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final instruments = await _repo.findAllFavorite();
      emit(state.copyWith(
        status: Status.success,
        instruments: instruments,
      ));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _addFavorite(
    FavoritesAddFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _repo.insertOneFavorite(event.instrument);
      final instruments = await _repo.findAllFavorite();
      emit(state.copyWith(
        status: Status.success,
        instruments: instruments,
      ));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _deleteFavorite(
    FavoritesDeleteFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _repo.deleteOneFavorite(event.name);
      final instruments = await _repo.findAllFavorite();
      emit(state.copyWith(
        status: Status.success,
        instruments: instruments,
      ));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _deleteFavorites(
    FavoritesDeleteFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _repo.deleteFavorites();
      final instruments = await _repo.findAllFavorite();
      emit(state.copyWith(
        status: Status.success,
        instruments: instruments,
      ));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
