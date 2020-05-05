import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_actions.freezed.dart';

@freezed
abstract class SettingsActions with _$SettingsActions {
  /// A `SettingsAction` that signals Redux to toggle the temperature unit.
  const factory SettingsActions.toggleTemperatureUnitAction() =
      ToggleTemperatureUnitAction;
}
