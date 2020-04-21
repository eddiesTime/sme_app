import 'package:redux/redux.dart';
import 'package:redux_example/redux/actions/settings_actions.dart';
import 'package:redux_example/redux/model/settings_state.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

final settingsReducer = combineReducers<SettingsState>([
  TypedReducer<SettingsState, ToggleTemperatureUnitAction>(
      _toggleTemperatureUnit)
]);

SettingsState _toggleTemperatureUnit(
    SettingsState settingsState, ToggleTemperatureUnitAction action) {
  TemperatureUnit newValue =
      settingsState.temperatureUnit == TemperatureUnit.celsius
          ? TemperatureUnit.fahrenheit
          : TemperatureUnit.celsius;
  return SettingsState(temperatureUnit: newValue);
}
