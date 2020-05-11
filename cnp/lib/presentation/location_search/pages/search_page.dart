import 'package:cnp/presentation/location_search/widgets/city_selection.dart';
import 'package:flutter/material.dart';

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
