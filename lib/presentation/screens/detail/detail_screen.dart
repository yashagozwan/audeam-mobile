import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/core/utils/utils.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FavoritesBloc>().add(const FavoritesStarted());
    final textTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () async {
        context.read<HomeBloc>().add(const HomeStarted());
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: 'Musical Instrument',
        ),
        body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            final status = state.status;
            final instrument = state.instrument;

            if (status == Status.loading) {
              return const CenterLoading();
            }

            if (status == Status.success) {
              return SlidingUpPanel(
                body: Column(
                  children: [
                    const SizedBox(height: 16),
                    Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: Image.network(
                            instrument.image,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: BlocBuilder<FavoritesBloc, FavoritesState>(
                              builder: (context, state) {
                                final favorites = state.instruments
                                    .where((e) => e.name == instrument.name);

                                final iconData = favorites.isEmpty
                                    ? Icons.favorite_border_outlined
                                    : Icons.favorite;

                                final onPressed = favorites.isEmpty
                                    ? () {
                                        context.read<FavoritesBloc>().add(
                                              FavoritesAddFavorite(
                                                instrument: instrument,
                                              ),
                                            );
                                      }
                                    : () {
                                        context.read<FavoritesBloc>().add(
                                              FavoritesDeleteFavorite(
                                                name: instrument.name,
                                              ),
                                            );
                                      };

                                return MaterialButton(
                                  minWidth: 50,
                                  height: 50,
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.zero,
                                  elevation: 0,
                                  color: Colors.red,
                                  onPressed: onPressed,
                                  child: Icon(
                                    iconData,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                maxHeight: MediaQuery.of(context).size.height - 200,
                minHeight: MediaQuery.of(context).size.height - 450,
                panelBuilder: (sc) {
                  const color = Colors.indigo;

                  return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 16,
                          decoration: const BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: color,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                instrument.name,
                                style: textTheme.titleLarge?.copyWith(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                instrument.description,
                                style: textTheme.bodyLarge?.copyWith(
                                  height: 1.7,
                                  color: Colors.white,
                                ),
                              ),
                              const Divider(
                                height: 32,
                                color: Colors.white,
                              ),
                              Text(
                                'Search in Marketplace',
                                style: textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 24),
                              OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  launchUrl(
                                    Tokopedia.getUrl(instrument.name),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      width: 30,
                                      child:
                                          Image.asset(ImageAssetPath.tokopedia),
                                    ),
                                    const Text(
                                      'Tokopedia',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
