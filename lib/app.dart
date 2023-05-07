import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audeam_mobile/core/theme/theme.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/core/constants/constants.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => DetailBloc()),
        BlocProvider(create: (context) => RecognizingBloc()),
      ],
      child: MaterialApp(
        theme: CustomTheme.light,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splash,
        routes: {
          RouteName.home: (context) => const HomeScreen(),
          RouteName.splash: (context) => const SplashScreen(),
          RouteName.recognizing: (context) => const RecognizingScreen(),
          RouteName.detail: (context) => const DetailScreen(),
          RouteName.notFound: (context) => const NotFoundScreen(),
        },
      ),
    );
  }
}
