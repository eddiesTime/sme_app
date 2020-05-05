import 'package:states_rebuilder_example/domain/settings/settings_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Holds a reference to `SettingsEntity`.
///
/// It is used by the reative model in by states_provider.
class SettingsStore {
  SettingsStore(this._settingsEntity);

  SettingsEntity _settingsEntity;
  SettingsEntity get settingsEntity => _settingsEntity;

  /// Toggles the temperature unit between `celsius` and `fahrenheit`.
  void toggleTemperatureUnit() {
    _settingsEntity.temperatureUnit == TemperatureUnit.celsius
        ? _settingsEntity = SettingsEntity.fahrenheit()
        : _settingsEntity = SettingsEntity.celsius();
  }
}
