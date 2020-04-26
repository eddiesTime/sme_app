import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_actions.freezed.dart';

@freezed
abstract class SettingsActions with _$SettingsActions {
  const factory SettingsActions.toggleTemperatureUnitAction() =
      ToggleTemperatureUnitAction;
}
