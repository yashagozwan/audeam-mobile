import 'package:flutter/foundation.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class HomeReset extends HomeEvent {
  const HomeReset();
}

class HomeStarted extends HomeEvent {
  const HomeStarted();
}
