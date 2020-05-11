part of 'settings_bloc.dart';

/// An interface to specify settings events.
@freezed
abstract class SettingsEvent with _$SettingsEvent {
  /// A settings event so signal that the temperature unit switch has been changed.
  const factory SettingsEvent.toggleTemperatureUnit(bool value) =
      ToggleTemperatureUnit;
}
