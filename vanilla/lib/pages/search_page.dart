import 'package:flutter/material.dart';
import 'package:vanilla/widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  final Function _fetchWeather;
  SearchPage(this._fetchWeather);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('City'),
        ),
        body: CitySelection(_fetchWeather));
  }
}
