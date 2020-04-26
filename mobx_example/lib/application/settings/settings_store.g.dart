// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  Computed<bool> _$valueComputed;

  @override
  bool get value =>
      (_$valueComputed ??= Computed<bool>(() => super.value)).value;

  final _$settingsEntityAtom = Atom(name: '_SettingsStore.settingsEntity');

  @override
  SettingsEntity get settingsEntity {
    _$settingsEntityAtom.context.enforceReadPolicy(_$settingsEntityAtom);
    _$settingsEntityAtom.reportObserved();
    return super.settingsEntity;
  }

  @override
  set settingsEntity(SettingsEntity value) {
    _$settingsEntityAtom.context.conditionallyRunInAction(() {
      super.settingsEntity = value;
      _$settingsEntityAtom.reportChanged();
    }, _$settingsEntityAtom, name: '${_$settingsEntityAtom.name}_set');
  }

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

  @override
  void toggleTemperatureUnit() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction();
    try {
      return super.toggleTemperatureUnit();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'settingsEntity: ${settingsEntity.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
