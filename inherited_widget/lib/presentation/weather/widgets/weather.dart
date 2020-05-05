import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inherited_widget/application/app_state.dart';
import 'package:inherited_widget/presentation/app_state_container.dart';
import 'package:inherited_widget/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:inherited_widget/presentation/weather/widgets/gradient_container.dart';
import 'package:inherited_widget/presentation/weather/widgets/last_updated.dart';
import 'package:inherited_widget/presentation/weather/widgets/location.dart';

/// This widget builds the content of the weather screen.
class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;
  AppStateContainerState _container;
  AppState _appState;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    _container = AppStateContainer.of(context);
    _appState = _container.appState;

    return Center(child: _buildUI());
  }

  Widget _buildUI() {
    if (_appState.weatherEntity.isLoading) {
      return _buildLoading();
    }
    if (_appState.weatherEntity.hasError) {
      return _buildError();
    }
    if (_appState.weatherEntity.weatherResponse.isNone()) {
      return _buildIdle();
    }
    _refreshCompleter?.complete();
    _refreshCompleter = Completer<void>();
    return _buildWeather();
  }

  Widget _buildWeather() {
    return GradientContainer(
      color: _appState.themeEntity.materialColor,
      child: RefreshIndicator(
        onRefresh: () => _container.refreshWeatherData(
          location: _appState.weatherEntity.city,
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(
                  location: _appState.weatherEntity.weatherResponse
                      .getOrElse(() => null)
                      .title,
                ),
              ),
            ),
            Center(
              child: LastUpdated(
                dateTime:
                    _appState.weatherEntity.lastUpdated.getOrElse(() => null),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                  weather: _appState.weatherEntity.weatherResponse
                      .getOrElse(() => null)
                      .weatherCollection
                      .first,
                  temperatureUnit: _appState.settingsEntity.temperatureUnit,
                ),
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
