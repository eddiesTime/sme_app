import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class TemperatureModel extends ChangeNotifier {
  TemperatureUnit _temperatureUnit = TemperatureUnit.celsius;

  TemperatureUnit get temperatureUnit => _temperatureUnit;

  void toggleTemperatureUnit(bool value) {
    _temperatureUnit == TemperatureUnit.celsius
        ? _temperatureUnit = TemperatureUnit.fahrenheit
        : _temperatureUnit = TemperatureUnit.celsius;
    notifyListeners();
  }
}
