import 'package:bloc_vanilla/presentation/location_search/widgets/city_selection.dart';
import 'package:flutter/material.dart';

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
