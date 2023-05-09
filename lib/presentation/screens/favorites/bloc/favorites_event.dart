import 'package:audeam_mobile/data/models/models.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class FavoritesEvent {
  const FavoritesEvent();
}

class FavoritesStarted extends FavoritesEvent {
  const FavoritesStarted();
}

class FavoritesAddFavorite extends FavoritesEvent {
  final MusicalInstrument instrument;

  const FavoritesAddFavorite({
    required this.instrument,
  });
}

class FavoritesDeleteFavorite extends FavoritesEvent {
  final String name;

  const FavoritesDeleteFavorite({
    required this.name,
  });
}

class FavoritesDeleteFavorites extends FavoritesEvent {
  const FavoritesDeleteFavorites();
}
