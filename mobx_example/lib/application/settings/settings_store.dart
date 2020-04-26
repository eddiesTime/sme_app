import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx_example/domain/settings/settings_entity.dart';

part 'settings_store.g.dart';

@lazySingleton
class SettingsStore extends _SettingsStore with _$SettingsStore {
  SettingsStore({@required SettingsEntity settingsEntity})
      : super(settingsEntity);
}

abstract class _SettingsStore with Store {
  _SettingsStore(this.settingsEntity);

  @observable
  SettingsEntity settingsEntity;

  @computed
  bool get value {
    return settingsEntity == SettingsEntity.celsius();
  }

  @action
  void toggleTemperatureUnit() {
    settingsEntity == SettingsEntity.celsius()
        ? settingsEntity = SettingsEntity.fahrenheit()
        : settingsEntity = SettingsEntity.celsius();
  }
}
