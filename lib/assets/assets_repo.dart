import 'package:flutter/services.dart';

class AssetsRepo {
  final Map<String, dynamic> _data = {
    'files/input1.txt': null,
  };

  Future<void> init() async {
    _data['files/input1.txt'] = await rootBundle.loadString('files/input1.txt');
  }

  String? getInputFile() => _data['files/input1.txt'];
}
