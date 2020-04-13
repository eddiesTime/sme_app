import 'package:states_rebuilder_example/model/enums/enum_temperature_units.dart';

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
