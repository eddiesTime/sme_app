// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TemperatureStore on _TemperatureStore, Store {
  Computed<bool> _$valueComputed;

  @override
  bool get value =>
      (_$valueComputed ??= Computed<bool>(() => super.value)).value;

  final _$tempUnitAtom = Atom(name: '_TemperatureStore.tempUnit');

  @override
  TemperatureUnit get tempUnit {
    _$tempUnitAtom.context.enforceReadPolicy(_$tempUnitAtom);
    _$tempUnitAtom.reportObserved();
    return super.tempUnit;
  }

  @override
  set tempUnit(TemperatureUnit value) {
    _$tempUnitAtom.context.conditionallyRunInAction(() {
      super.tempUnit = value;
      _$tempUnitAtom.reportChanged();
    }, _$tempUnitAtom, name: '${_$tempUnitAtom.name}_set');
  }

  final _$_TemperatureStoreActionController =
      ActionController(name: '_TemperatureStore');

  @override
  void toggleTemperatureUnit() {
    final _$actionInfo = _$_TemperatureStoreActionController.startAction();
    try {
      return super.toggleTemperatureUnit();
    } finally {
      _$_TemperatureStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'tempUnit: ${tempUnit.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
