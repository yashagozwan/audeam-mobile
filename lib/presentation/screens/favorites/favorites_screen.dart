import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Favorite',
        actions: [
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              if (state.instruments.isEmpty) {
                return const SizedBox.shrink();
              }

              return IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        onPressedNo: () {
                          Navigator.pop(context);
                        },
                        onPressedYes: () {
                          context.read<FavoritesBloc>().add(
                                const FavoritesDeleteFavorites(),
                              );

                          Navigator.pop(context);
                        },
                        title: 'Are you sure want to delete all history',
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete_forever),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          final instruments = state.instruments;

          if (instruments.isEmpty) {
            return Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.not_interested_outlined,
                        size: 50,
                        color: Colors.black54,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'No Favourites',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
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
                  clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: Image.network(
                              instrument.image,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          instrument.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          instrument.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            context.read<FavoritesBloc>().add(
                                  FavoritesDeleteFavorite(
                                    name: instrument.name,
                                  ),
                                );
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: instruments.length,
          );
        },
      ),
    );
  }
}
