import 'package:flutter/foundation.dart';

@immutable
abstract class DetailEvent {
  const DetailEvent();
}

class DetailReset extends DetailEvent {
  const DetailReset();
}

class DetailGetInstrument extends DetailEvent {
  final String name;
  final bool isFromRecognizing;

  const DetailGetInstrument({
    required this.name,
    this.isFromRecognizing = false,
  });
}
