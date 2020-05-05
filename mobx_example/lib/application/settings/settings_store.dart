import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx_example/domain/settings/settings_entity.dart';

part 'settings_store.g.dart';

/// Used in MobX to manage the state of settings related data.
@lazySingleton
class SettingsStore extends _SettingsStore with _$SettingsStore {
  SettingsStore({@required SettingsEntity settingsEntity})
      : super(settingsEntity);
}

abstract class _SettingsStore with Store {
  _SettingsStore(this.settingsEntity);

  /// A MobX observable for `SettingsEntity`.
  @observable
  SettingsEntity settingsEntity;

  /// A MobX computed value that computes a `bool` to represent if the current temperature unit is celsius
  @computed
  bool get value {
    return settingsEntity == SettingsEntity.celsius();
  }

  /// A MobX action that signals MobX to toggle between the temperature units.
  @action
  void toggleTemperatureUnit() {
    settingsEntity == SettingsEntity.celsius()
        ? settingsEntity = SettingsEntity.fahrenheit()
        : settingsEntity = SettingsEntity.celsius();
  }
}
