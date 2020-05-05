import 'package:flutter/material.dart';
import 'package:states_rebuilder_example/presentation/location_search/widgets/city_selection.dart';

/// This widget functions as a container for the location search screen.
///
/// It builds a scaffold and contains the search content.
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City'),
      ),
      body: CitySelection(),
    );
  }
}
