import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/core/constants/image_asset_path.dart';
import 'package:audeam_mobile/core/utils/utils.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/presentation/widgets/center_loading.dart';
import 'package:audeam_mobile/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: Image.network(
                      instrument.image,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    instrument.name,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    instrument.description,
                    textAlign: TextAlign.justify,
                    style: textTheme.bodyLarge?.copyWith(
                      height: 1.4,
                      color: Colors.grey,
                    ),
                  ),
                  const Divider(height: 32),
                  Text(
                    'Online Store',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
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
                          child: Image.asset(ImageAssetPath.tokopedia),
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
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
