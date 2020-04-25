import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/location_search/widgets/city_selection.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('City'),
        ),
        body: CitySelection());
  }
}