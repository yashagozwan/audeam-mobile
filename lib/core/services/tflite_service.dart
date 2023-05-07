import 'package:tflite_audio/tflite_audio.dart';

class TfliteService {
  static const _audeamModel = 'assets/tflite/audeam.tflite';
  static const _audeamLabels = 'assets/tflite/labels.txt';
  static const _inputType = 'rawAudio';

  static Future<void> loadModel() => TfliteAudio.loadModel(
        model: _audeamModel,
        label: _audeamLabels,
        inputType: _inputType,
      );

  static Stream<Map<dynamic, dynamic>> startAudioRecognizing() =>
      TfliteAudio.startAudioRecognition(
        sampleRate: 44100,
        bufferSize: 22016,
        numOfInferences: 5,
      );
}
