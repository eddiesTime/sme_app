import 'package:states_rebuilder_example/domain/settings/settings_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class SettingsStore {
  SettingsStore(this._settingsEntity);

  SettingsEntity _settingsEntity;
  SettingsEntity get settingsEntity => _settingsEntity;

  void toggleTemperatureUnit() {
    _settingsEntity.temperatureUnit == TemperatureUnit.celsius
        ? _settingsEntity = SettingsEntity.fahrenheit()
        : _settingsEntity = SettingsEntity.celsius();
  }
}
