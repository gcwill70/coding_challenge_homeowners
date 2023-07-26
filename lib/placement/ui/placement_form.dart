import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          width: min(500, MediaQuery.of(context).size.width),
          height: min(600, MediaQuery.of(context).size.height),
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
    );
  }
}
