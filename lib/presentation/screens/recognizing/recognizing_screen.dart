import 'package:audeam_mobile/core/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class RecognizingScreen extends StatefulWidget {
  const RecognizingScreen({Key? key}) : super(key: key);

  @override
  State<RecognizingScreen> createState() => _RecognizingScreenState();
}

class _RecognizingScreenState extends State<RecognizingScreen> {
  Future<void> _initial() async {}

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
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
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: MaterialButton(
                  shape: const CircleBorder(),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
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
    );
  }
}
