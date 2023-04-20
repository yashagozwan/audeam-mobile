import 'package:audeam_mobile/core/constants/custom_colors.dart';
import 'package:audeam_mobile/core/constants/route_names.dart';
import 'package:audeam_mobile/core/cubit/musical_instrument/musical_instrument_cubit.dart';
import 'package:audeam_mobile/presentation/widgets/touchable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _initial() async {
    context.read<MusicalInstrumentCubit>().findOne("Gitar");
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            _buildName(),
            const SizedBox(height: 8),
            _buildCards(),
            const SizedBox(height: 16),
            _buildMusicalInstrument(),
            const SizedBox(height: 16),
            _buildHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildMusicalInstrument() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Musical Instrument',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'History',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Mantap',
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const CircleAvatar(),
        ],
      ),
    );
  }

  Widget _buildCards() {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Touchable(
            onPressed: () => Navigator.pushNamed(
              context,
              RouteNames.recognizing,
            ),
            radius: 24,
            child: Container(
              width: 200,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.multitrack_audio,
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Detector Audio',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        itemCount: 3,
      ),
    );
  }
}
