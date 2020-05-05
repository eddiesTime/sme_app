import 'package:redux_example/application/redux/model/models.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// Returns the temperature unit of the current settings state.
TemperatureUnit temperatureUnitSelector(AppState state) =>
    state.settingsState.settingsEntity.temperatureUnit;

/// Return the current settings state.
SettingsState settingsStateSelector(AppState state) => state.settingsState;
