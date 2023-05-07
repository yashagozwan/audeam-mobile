import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/core/constants/image_asset_path.dart';
import 'package:audeam_mobile/core/utils/utils.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/presentation/widgets/center_loading.dart';
import 'package:audeam_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(
                      height: 300,
                      child: Image.network(
                        instrument.image,
                      ),
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
                              ElevatedButton(
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
