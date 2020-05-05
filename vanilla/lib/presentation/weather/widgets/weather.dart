import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vanilla/application/app_state.dart';
import 'package:vanilla/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:vanilla/presentation/weather/widgets/gradient_container.dart';
import 'package:vanilla/presentation/weather/widgets/last_updated.dart';
import 'package:vanilla/presentation/weather/widgets/location.dart';

/// This widget builds the content of the weather screen.
class Weather extends StatelessWidget {
  final AppState _appState;
  final Future<void> Function({@required String location}) _onRefresh;

  const Weather(this._appState, this._onRefresh);

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildUI());
  }

  Widget _buildUI() {
    if (_appState.weatherEntity.weatherResponse.isSome()) {
      return _buildWeather();
    }
    if (_appState.weatherEntity.hasError) {
      return _buildError();
    }
    if (_appState.weatherEntity.isLoading) {
      return _buildLoading();
    }
    return _buildIdle();
  }

  Widget _buildWeather() {
    return GradientContainer(
      color: _appState.themeEntity.materialColor,
      child: RefreshIndicator(
        onRefresh: () => _onRefresh(location: _appState.weatherEntity.city),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(
                    location: _appState.weatherEntity.weatherResponse
                        .getOrElse(() => null)
                        .title),
              ),
            ),
            Center(
              child: LastUpdated(
                  dateTime: _appState.weatherEntity.lastUpdated
                      .getOrElse(() => null)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                    weather: _appState.weatherEntity.weatherResponse
                        .getOrElse(() => null)
                        .weatherCollection
                        .first,
                    temperatureUnit: _appState.settingsEntity.temperatureUnit),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    return Text(
      'Something went wrong!',
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildIdle() {
    return const Center(child: Text('Please Select a Location'));
  }
}
