import 'package:audeam_mobile/data/models/models.dart';
import 'package:audeam_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class InstrumentsScreen extends StatelessWidget {
  final Iterable<MusicalInstrument> instuments;

  const InstrumentsScreen({
    Key? key,
    required this.instuments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Instruments'),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final instrument = instuments.elementAt(index);

          return Card(
            child: Text(instrument.name),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(),
        itemCount: instuments.length,
      ),
    );
  }
}
