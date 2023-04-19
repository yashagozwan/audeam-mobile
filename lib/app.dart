import 'package:audeam_mobile/core/constants/route_names.dart';
import 'package:audeam_mobile/presentation/screens/home/home_screen.dart';
import 'package:audeam_mobile/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: MaterialApp(
        initialRoute: RouteNames.splash,
        routes: {
          RouteNames.home: (context) => const HomeScreen(),
          RouteNames.splash: (context) => const SplashScreen(),
        },
      ),
    );
  }
}
