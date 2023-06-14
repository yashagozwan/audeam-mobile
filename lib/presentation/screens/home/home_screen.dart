import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/models/models.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _initial() async {
    context.read<HomeBloc>().add(const HomeStarted());
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringResources.appName,
        actions: [
          IconButton(
            onPressed: () {
              context.read<FavoritesBloc>().add(const FavoritesStarted());
              Navigator.pushNamed(context, RouteName.favorites);
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Audio Recognizing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Touchable(
            radius: 16,
            onPressed: () {
              return Navigator.pushNamed(context, RouteName.recognizing);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Transform.translate(
              offset: const Offset(-5, 0),
              child: const Row(
                children: [
                  Icon(
                    Icons.music_note_rounded,
                    size: 30,
                  ),
                  Text(
                    'Instruments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final status = state.status;
              var instruments = state.instruments;

              if (instruments.isNotEmpty) {
                instruments = instruments.toList().sublist(0, 4);
              }

              if (status == Status.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (status == Status.success) {
                return SizedBox(
                  height: 332,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final instrument = instruments.elementAt(index);
                          return Card(
                            child: SizedBox(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                    padding: const EdgeInsets.all(16),
                                    child: Image.network(
                                      instrument.image,
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          instrument.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          instrument.description,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            height: 1.2,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: ElevatedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        context.read<DetailBloc>().add(
                                              DetailGetInstrument(
                                                name: instrument.name,
                                              ),
                                            );

                                        Navigator.pushNamed(
                                          context,
                                          RouteName.detail,
                                        );
                                      },
                                      child: const Text('View'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemCount: instruments.length,
                      ),
                      Card(
                        clipBehavior: Clip.hardEdge,
                        child: Touchable(
                          color: Colors.black12,
                          onPressed: () {
                            context.read<InstrumentsBloc>().add(
                                  InstrumentsGetInstruments(
                                    instruments: state.instruments,
                                    isFromFirebase: true,
                                  ),
                                );

                            Navigator.pushNamed(
                              context,
                              RouteName.instruments,
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(3, 3),
                                        blurRadius: 8,
                                        color: Colors.grey.shade300,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.chevron_right_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'View More\nInstruments',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.history,
                  size: 30,
                ),
                SizedBox(width: 4),
                Text(
                  'History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final histories = state.histories;
              Iterable<MusicalInstrument> instruments = [];

              if (histories.isNotEmpty && histories.length >= 4) {
                instruments = histories.toList().sublist(0, 4);
              } else {
                instruments = histories;
              }

              if (instruments.isEmpty) {
                return const Card(
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.do_not_disturb_alt_rounded,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Empty',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return SizedBox(
                height: 320,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final history = instruments.elementAt(index);
                        return SizedBox(
                          width: 200,
                          child: GestureDetector(
                            onTap: () {
                              context.read<DetailBloc>().add(
                                    DetailGetInstrument(
                                      name: history.name,
                                    ),
                                  );

                              Navigator.pushNamed(context, RouteName.detail);
                            },
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(16),
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                      history.image,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            history.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18,
                                                ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            history.description,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: Colors.grey,
                                                ),
                                          ),
                                          const SizedBox(height: 16),
                                          Transform.translate(
                                            offset: const Offset(-24, 0),
                                            child: MaterialButton(
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
                                                            .read<HomeBloc>()
                                                            .add(
                                                              HomeDeleteOneHistory(
                                                                id: history.id,
                                                              ),
                                                            );
                                                        Navigator.pop(context);
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                              shape: const CircleBorder(),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              child: const Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemCount: instruments.length,
                    ),
                    Card(
                      clipBehavior: Clip.hardEdge,
                      child: Touchable(
                        color: Colors.black12,
                        onPressed: () {
                          context.read<InstrumentsBloc>().add(
                                InstrumentsGetInstruments(
                                  instruments: histories.toList().reversed,
                                  isFromFirebase: false,
                                ),
                              );

                          Navigator.pushNamed(
                            context,
                            RouteName.instruments,
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(3, 3),
                                      blurRadius: 8,
                                      color: Colors.grey.shade300,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.chevron_right_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'View More\nHistory',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
