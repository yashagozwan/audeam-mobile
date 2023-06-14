import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstrumentsScreen extends StatelessWidget {
  const InstrumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFromFirebase = context.read<InstrumentsBloc>().state.isFromFirebase;
    final title = isFromFirebase ? 'History' : 'Instruments';
    return WillPopScope(
      onWillPop: () async {
        context.read<HomeBloc>().add(const HomeStarted());
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: title,
          actions: [
            BlocBuilder<InstrumentsBloc, InstrumentsState>(
              builder: (context, state) {
                return state.isFromFirebase
                    ? const SizedBox.shrink()
                    : IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomAlertDialog(
                                title: 'Are you sure you want to delete all',
                                onPressedNo: () => Navigator.pop(context),
                                onPressedYes: () {
                                  context.read<InstrumentsBloc>().add(
                                        const InstrumentsDeleteAllInstrument(),
                                      );
                                  Navigator.pop(context);
                                },
                                icon: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                    size: 50,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.clear,
                        ),
                      );
              },
            ),
          ],
        ),
        body: BlocBuilder<InstrumentsBloc, InstrumentsState>(
          builder: (context, state) {
            final instruments = state.instruments;
            final isFromFirebase = state.isFromFirebase;
            final status = state.status;

            if (status == Status.loading) {
              return const CenterLoading();
            }

            if (status == Status.success) {
              if (instruments.isEmpty && !state.isFromFirebase) {
                return const Center(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.not_interested_rounded,
                            size: 50,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'History Empty',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

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
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return CustomAlertDialog(
                                                  onPressedNo: () {
                                                    Navigator.pop(context);
                                                  },
                                                  onPressedYes: () {
                                                    context
                                                        .read<InstrumentsBloc>()
                                                        .add(
                                                          InstrumentsDeleteOneInstrument(
                                                            id: instrument.id,
                                                          ),
                                                        );
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              },
                                            );
                                          },
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
            }

            if (status == Status.failure) {
              return const SizedBox.shrink();
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
