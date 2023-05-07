import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/core/constants/image_asset_path.dart';
import 'package:audeam_mobile/core/services/tflite_service.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecognizingScreen extends StatefulWidget {
  const RecognizingScreen({Key? key}) : super(key: key);

  @override
  State<RecognizingScreen> createState() => _RecognizingScreenState();
}

class _RecognizingScreenState extends State<RecognizingScreen> {
  bool _recording = false;
  Stream<Map<dynamic, dynamic>>? result;

  Future<void> _initial() async {
    TfliteService.loadModel();
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  void _recorder() {
    String recognition = "";

    if (!_recording) {
      setState(() => _recording = true);

      result = TfliteService.startAudioRecognizing();
      result?.listen((event) {
        recognition = event["recognitionResult"];
      }).onDone(() {
        setState(() => _recording = false);

        final result = recognition.split(" ")[1];

        if (result == StringResources.background) {
          Navigator.pushReplacementNamed(
            context,
            RouteName.notFound,
          );
        } else {
          context.read<DetailBloc>().add(
                DetailGetInstrument(
                  name: result,
                  isFromRecognizing: true,
                ),
              );
          Navigator.pushReplacementNamed(
            context,
            RouteName.detail,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Recognizing',
        centered: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _recording
                  ? DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            "Listening...",
                            speed: const Duration(
                              milliseconds: 100,
                            ),
                          ),
                        ],
                        repeatForever: true,
                      ),
                    )
                  : const Text(
                      "What's Sound?",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: _recording
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: MaterialButton(
                    shape: const CircleBorder(),
                    color: _recording
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                    onPressed: _recorder,
                    elevation: 0,
                    padding: const EdgeInsets.all(32),
                    child: const Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
