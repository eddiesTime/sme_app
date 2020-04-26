import 'package:cnp/domain/settings/settings_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

@lazySingleton
class SettingsNotifier extends ChangeNotifier {
  SettingsNotifier(this._settingsEntity);
  SettingsEntity _settingsEntity;
  TemperatureUnit get temperatureUnit => _settingsEntity.temperatureUnit;

  void toggleTemperatureUnit() {
    _settingsEntity.temperatureUnit == TemperatureUnit.celsius
        ? _settingsEntity = SettingsEntity.fahrenheit()
        : _settingsEntity = SettingsEntity.celsius();
    notifyListeners();
  }
}
