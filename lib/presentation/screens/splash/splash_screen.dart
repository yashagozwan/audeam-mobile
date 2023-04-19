import 'package:audeam_mobile/core/constants/route_names.dart';
import 'package:audeam_mobile/core/constants/string_resources.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _initial() async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.pushNamed(context, RouteNames.home),
    );
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: const [
                Text('Audeam'),
              ],
            ),
          ),
          const Text(
            StringResources.version,
          ),
        ],
      ),
    );
  }
}
