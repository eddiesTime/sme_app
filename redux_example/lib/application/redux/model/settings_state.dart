import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:redux_example/domain/settings/settings_entity.dart';

part 'settings_state.freezed.dart';

/// Represents the state of the settings data.
@freezed
@lazySingleton
abstract class SettingsState with _$SettingsState {
  @factoryMethod
  const factory SettingsState({@required SettingsEntity settingsEntity}) =
      _SettingsState;
}
