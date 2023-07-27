import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearl/placement/bloc/placement_bloc.dart';

class PlacementOutputPage extends StatelessWidget {
  const PlacementOutputPage({Key? key}) : super(key: key);

  static Route<void> route(PlacementBloc bloc) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider.value(
        value: bloc,
        child: Scaffold(appBar: AppBar(), body: const PlacementOutputPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((PlacementBloc bloc) => bloc.state);
    String message = 'Calculating...';
    double progress = 0;
    if (state is PlacementLoadingInput) {
      message = 'Loading input...';
      progress = 0.25;
    } else if (state is PlacementLoadedInput) {
      message = 'Loaded input!';
      progress = 0.50;
    } else if (state is PlacementCalculating) {
      message = 'Calculating placement...';
      progress = 0.75;
    } else if (state is PlacementComplete) {
      message = 'Placement complete!\n\n${state.output}';
      progress = 1.0;
    } else if (state is PlacementError) {
      message = 'Error placing homeowners.\nPlease try again.';
    }
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Flexible(
            flex: 2,
            child: SizedBox.square(
              dimension: 100,
              child: CircularProgressIndicator(
                strokeWidth: 10.0,
                value: progress,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            flex: 2,
            child: Text(message),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
