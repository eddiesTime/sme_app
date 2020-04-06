import 'package:flutter/material.dart';
import 'package:inherited_widget/widgets/widgets.dart';

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
