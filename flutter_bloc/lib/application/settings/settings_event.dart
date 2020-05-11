part of 'settings_bloc.dart';

/// An interface to specify settings events.
@freezed
abstract class SettingsEvent with _$SettingsEvent {
  /// Specifies a settings event with a given [bool] from a switch.
  const factory SettingsEvent.toggleTemperatureUnit(bool value) =
      ToggleTemperatureUnit;
}
