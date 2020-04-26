import 'package:redux_example/application/redux/model/models.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

TemperatureUnit temperatureUnitSelector(AppState state) =>
    state.settingsState.settingsEntity.temperatureUnit;
SettingsState settingsStateSelector(AppState state) => state.settingsState;
