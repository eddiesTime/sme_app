import 'package:flutter/material.dart';
import 'package:vanilla/presentation/location_search/widgets/city_selection.dart';

class SearchPage extends StatelessWidget {
  final Future<void> Function({@required String location}) _fetchWeather;
  const SearchPage(this._fetchWeather);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('City'),
        ),
        body: CitySelection(_fetchWeather));
  }
}
