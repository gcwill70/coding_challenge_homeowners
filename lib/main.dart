import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearl/assets/assets_repo.dart';
import 'package:pearl/placement/repo/placement_repo.dart';

import 'placement/placement.dart';

void main() async {
  // bootstrap
  WidgetsFlutterBinding.ensureInitialized();
  final assetsRepo = AssetsRepo();
  await assetsRepo.init();
  final placementRepo = PlacementRepo();
  // run app
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider.value(value: assetsRepo),
      RepositoryProvider.value(value: placementRepo),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pearl Placement Tool',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00497D)),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocProvider(
              create: (context) => PlacementBloc(
                RepositoryProvider.of<PlacementRepo>(context),
              ),
              child: const PlacementForm(),
            ),
          ),
        ),
      ),
    );
  }
}
