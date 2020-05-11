import 'package:cnp/domain/settings/settings_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Extends [ChangeNotifier] to be used by [ChangeNotifierProvider].
///
/// Handles settings data related logic.
@lazySingleton
class SettingsNotifier extends ChangeNotifier {
  SettingsNotifier(this._settingsEntity);
  SettingsEntity _settingsEntity;

  /// Returns the [TemperatureUnit] of the [SettingsEntity].
  TemperatureUnit get temperatureUnit => _settingsEntity.temperatureUnit;

  /// Updated the local [SettingsEntity] with
  /// either [SettingsEntity.celsius()] or [SettingsEntity.fahrenheit()]
  /// depending on the current temperature unit.
  ///
  /// Notifies its listeners after the [SettingsEntity] has been updated.
  void toggleTemperatureUnit() {
    _settingsEntity.temperatureUnit == TemperatureUnit.celsius
        ? _settingsEntity = SettingsEntity.fahrenheit()
        : _settingsEntity = SettingsEntity.celsius();
    notifyListeners();
  }
}
