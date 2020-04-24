import 'package:flutter/material.dart';
import 'package:vanilla/application/app_state.dart';
import 'package:vanilla/presentation/location_search/pages/search_page.dart';
import 'package:vanilla/presentation/settings/pages/settings_page.dart';
import 'package:vanilla/presentation/weather/widgets/weather.dart';

class WeatherPage extends StatelessWidget {
  final AppState _appState;
  final Function _toggleTemperatureUnit;
  final Function _fetchWeather;
  final Future<void> Function({@required String location}) _refreshWeather;

  const WeatherPage(this._appState, this._toggleTemperatureUnit,
      this._fetchWeather, this._refreshWeather);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vanilla Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                      _appState.settingsEntity.temperatureUnit,
                      _toggleTemperatureUnit),
                ),
              );
            },
          ),
        ],
      ),
      body: Weather(_appState, _refreshWeather),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _appState.themeEntity.themeData.primaryColor,
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
