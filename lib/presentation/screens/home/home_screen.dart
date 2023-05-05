import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/presentation/screens/screens.dart';
import 'package:audeam_mobile/presentation/widgets/custom_app_bar.dart';
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
      appBar: const CustomAppBar(
        title: StringResources.appName,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Instruments',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final status = state.status;
              final instruments = state.instruments;

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
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    child: ElevatedButton(
                                      onPressed: () {},
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
                                'View More\nInstrument',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
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
            child: Text(
              'History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
