part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({@required TemperatureUnit temperatureUnit}) =
      _SettingsState;
  factory SettingsState.celcius() =>
      const SettingsState(temperatureUnit: TemperatureUnit.celsius);
  factory SettingsState.fahrenheit() =>
      const SettingsState(temperatureUnit: TemperatureUnit.fahrenheit);
}
