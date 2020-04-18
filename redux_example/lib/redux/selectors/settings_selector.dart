import 'package:redux_example/model/enums/enum_temperature_units.dart';
import 'package:redux_example/redux/model/app_state.dart';
import 'package:redux_example/redux/model/models.dart';

TemperatureUnit temperatureUnitSelector(AppState state) =>
    state.settingsState.temperatureUnit;
SettingsState settingsStateSelector(AppState state) => state.settingsState;
