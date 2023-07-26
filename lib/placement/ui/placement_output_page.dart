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
        child: const PlacementOutputPage(),
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
      progress = 25;
    } else if (state is PlacementCalculating) {
      message = 'Calculating placement...';
      progress = 50;
    } else if (state is PlacementComplete) {
      message = 'Placement complete!\n\n${state.output}';
      progress = 100;
    } else if (state is PlacementError) {
      message = 'Error placing homeowners.\nPlease try again.';
      progress = 0;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(message),
        CircularProgressIndicator(value: progress),
      ],
    );
  }
}
