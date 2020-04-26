import 'package:redux/redux.dart';
import 'package:redux_example/application/redux/actions/settings_actions.dart';
import 'package:redux_example/application/redux/model/settings_state.dart';
import 'package:redux_example/domain/settings/settings_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

final Reducer<SettingsState> settingsReducer = combineReducers<SettingsState>([
  TypedReducer<SettingsState, ToggleTemperatureUnitAction>(
      _toggleTemperatureUnit)
]);

SettingsState _toggleTemperatureUnit(
    SettingsState settingsState, ToggleTemperatureUnitAction action) {
  final SettingsEntity _newSettingEntity =
      settingsState.settingsEntity.temperatureUnit == TemperatureUnit.celsius
          ? SettingsEntity.fahrenheit()
          : SettingsEntity.celsius();
  return SettingsState(settingsEntity: _newSettingEntity);
}
