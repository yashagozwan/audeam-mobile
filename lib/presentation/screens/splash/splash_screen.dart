import 'package:audeam_mobile/app.dart';
import 'package:audeam_mobile/core/constants/route_names.dart';
import 'package:audeam_mobile/core/constants/string_resources.dart';
import 'package:audeam_mobile/core/constants/svg_asset_path.dart';
import 'package:audeam_mobile/data/interfaces/musical_instrument.dart';
import 'package:audeam_mobile/data/models/musical_instrument_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _initial() async {
    await _audioPlayer.setAsset('assets/sounds/open_app.wav');
    await _audioPlayer.play();
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.home,
        (route) => false,
      ),
    );
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    SvgAssetPath.logo,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Audeam',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            StringResources.version,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
