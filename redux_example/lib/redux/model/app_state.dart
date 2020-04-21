import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux_example/redux/model/models.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

@immutable
class AppState {
  const AppState(
      {@required this.weatherState,
      @required this.themeState,
      @required this.settingsState,
      @required this.isLoading});

  final WeatherState weatherState;
  final ThemeState themeState;
  final SettingsState settingsState;
  final bool isLoading;

  factory AppState.initial() => AppState(
        settingsState: SettingsState(temperatureUnit: TemperatureUnit.celsius),
        themeState:
            ThemeState(theme: ThemeData.light(), color: Colors.lightBlue),
        weatherState: WeatherState(
          city: null,
          lastUpdated: null,
          weatherResponse: null,
        ),
        isLoading: false,
      );

  dynamic toJson() => {
        'weatherState': weatherState,
        'themeState': themeState,
        'settingsState': settingsState
      };

  @override
  String toString() {
    return 'AppState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
