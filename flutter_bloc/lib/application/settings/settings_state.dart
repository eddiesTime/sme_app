part of 'settings_bloc.dart';

/// An interface to specify settings states.
@freezed
abstract class SettingsState with _$SettingsState {
  /// Specifies a settings state for a given [TemperatureUnit].
  const factory SettingsState({@required TemperatureUnit temperatureUnit}) =
      _SettingsState;

  /// Specifies a settings state for the [TemperatureUnit] `celcius`.
  factory SettingsState.celcius() =>
      const SettingsState(temperatureUnit: TemperatureUnit.celsius);

  /// Specifies a settings state for the [TemperatureUnit] `fahrenheit`.
  factory SettingsState.fahrenheit() =>
      const SettingsState(temperatureUnit: TemperatureUnit.fahrenheit);
}
