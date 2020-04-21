import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class TemperatureStore {
  TemperatureStore() {
    _tempUnit = TemperatureUnit.celsius;
  }

  TemperatureUnit _tempUnit;
  TemperatureUnit get temperatureUnit => _tempUnit;

  void toggleTemperatureUnit() {
    _tempUnit == TemperatureUnit.celsius
        ? _tempUnit = TemperatureUnit.fahrenheit
        : _tempUnit = TemperatureUnit.celsius;
  }
}
