import 'package:audeam_mobile/core/constants/route_names.dart';
import 'package:audeam_mobile/core/cubit/musical_instrument/musical_instrument_cubit.dart';
import 'package:audeam_mobile/core/theme/custom_theme.dart';
import 'package:audeam_mobile/presentation/screens/home/home_screen.dart';
import 'package:audeam_mobile/presentation/screens/recognizing/recognizing_screen.dart';
import 'package:audeam_mobile/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubit/user/user_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => MusicalInstrumentCubit()),
      ],
      child: MaterialApp(
        theme: CustomTheme.light,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.splash,
        routes: {
          RouteNames.home: (context) => const HomeScreen(),
          RouteNames.splash: (context) => const SplashScreen(),
          RouteNames.recognizing: (context) => const RecognizingScreen(),
        },
      ),
    );
  }
}
