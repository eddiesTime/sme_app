import 'package:cnp/model/models.dart';
import 'package:flutter/material.dart';
import 'model/enums/enum_temperature_units.dart';

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
