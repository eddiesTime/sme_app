import 'package:flutter/material.dart';

import 'package:inherited_widget/model/models.dart' as model;
import 'package:inherited_widget/pages/pages.dart';
import 'package:inherited_widget/widgets/widgets.dart';

class WeatherPage extends StatelessWidget {
  final model.AppState _appState;
  final Function _toggleTemperatureUnit;
  final Function _fetchWeather;
  final Future<void> Function() _refreshWeather;

  WeatherPage(this._appState, this._toggleTemperatureUnit, this._fetchWeather,
      this._refreshWeather);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vanilla Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                      _appState.temperatureUnit, _toggleTemperatureUnit),
                ),
              );
            },
          ),
        ],
      ),
      body: Weather(_appState, _refreshWeather),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _appState.theme.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(_fetchWeather),
            ),
          );
        },
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
