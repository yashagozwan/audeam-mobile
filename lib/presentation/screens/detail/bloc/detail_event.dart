import 'package:flutter/foundation.dart';

@immutable
abstract class DetailEvent {
  const DetailEvent();
}

class DetailReset extends DetailEvent {
  const DetailReset();
}

class DetailGetInstrument {
  final String instrumentName;

  const DetailGetInstrument({
    required this.instrumentName,
  });
}
