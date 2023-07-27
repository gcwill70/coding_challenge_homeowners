import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearl/assets/assets_repo.dart';
import 'package:pearl/placement/bloc/placement_bloc.dart';
import 'package:pearl/placement/ui/placement_output_page.dart';

class PlacementForm extends StatefulWidget {
  const PlacementForm({super.key});

  @override
  State<PlacementForm> createState() => _PlacementFormState();
}

class _PlacementFormState extends State<PlacementForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 500,
          height: 600,
          child: TextField(
            maxLines: null,
            expands: true,
            decoration: const InputDecoration(
              filled: true,
            ),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            controller: _controller,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.science),
              label: const Text('Load Test'),
              onPressed: () {
                setState(() {
                  final input =
                      RepositoryProvider.of<AssetsRepo>(context).getInputFile();
                  _controller.value = _controller.value.copyWith(text: input);
                });
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Place Homeowners'),
              onPressed: () {
                final bloc = BlocProvider.of<PlacementBloc>(context);
                bloc.add(PlacementLoadInput(_controller.text));
                Navigator.push(context, PlacementOutputPage.route(bloc));
              },
            ),
          ],
        ),
      ],
    );
  }
}
