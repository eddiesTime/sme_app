import 'package:redux_example/redux/model/app_state.dart';
import 'package:redux_example/redux/model/models.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

TemperatureUnit temperatureUnitSelector(AppState state) =>
    state.settingsState.temperatureUnit;
SettingsState settingsStateSelector(AppState state) => state.settingsState;
