import 'package:flutter/foundation.dart';

@immutable
abstract class RecognizingEvent {
  const RecognizingEvent();
}

class RecognizingReset extends RecognizingEvent {
  const RecognizingReset();
}

class RecognizingSetIsRecording extends RecognizingEvent {
  final bool isRecognizing;

  const RecognizingSetIsRecording({
    required this.isRecognizing,
  });
}

class RecognizingSetResult extends RecognizingEvent {
  final Stream<Map<dynamic, dynamic>> result;

  const RecognizingSetResult({
    required this.result,
  });
}
