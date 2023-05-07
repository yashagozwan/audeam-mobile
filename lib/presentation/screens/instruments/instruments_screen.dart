import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstrumentsScreen extends StatelessWidget {
  const InstrumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Instruments'),
      body: BlocBuilder<InstrumentsBloc, InstrumentsState>(
        builder: (context, state) {
          final instruments = state.instruments;
          final isFromFirebase = state.isFromFirebase;

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final instrument = instruments.elementAt(index);

              return GestureDetector(
                onTap: () {
                  context.read<DetailBloc>().add(
                        DetailGetInstrument(
                          name: instrument.name,
                        ),
                      );

                  Navigator.pushNamed(context, RouteName.detail);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Image.network(
                            instrument.image,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                instrument.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                instrument.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 16),
                              isFromFirebase
                                  ? const SizedBox.shrink()
                                  : ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Delete'),
                                    ),
                            ],
                          ),
                        ),
                        isFromFirebase
                            ? const Icon(
                                Icons.chevron_right_outlined,
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: instruments.length,
          );
        },
      ),
    );
  }
}
