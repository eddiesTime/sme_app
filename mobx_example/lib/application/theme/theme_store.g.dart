// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStore, Store {
  Computed<ThemeData> _$themeComputed;

  @override
  ThemeData get theme =>
      (_$themeComputed ??= Computed<ThemeData>(() => super.theme)).value;

  final _$themeEntityAtom = Atom(name: '_ThemeStore.themeEntity');

  @override
  ThemeEntity get themeEntity {
    _$themeEntityAtom.context.enforceReadPolicy(_$themeEntityAtom);
    _$themeEntityAtom.reportObserved();
    return super.themeEntity;
  }

  @override
  set themeEntity(ThemeEntity value) {
    _$themeEntityAtom.context.conditionallyRunInAction(() {
      super.themeEntity = value;
      _$themeEntityAtom.reportChanged();
    }, _$themeEntityAtom, name: '${_$themeEntityAtom.name}_set');
  }

  final _$_ThemeStoreActionController = ActionController(name: '_ThemeStore');

  @override
  void mapWeatherConditionToTheme(WeatherCondition condition) {
    final _$actionInfo = _$_ThemeStoreActionController.startAction();
    try {
      return super.mapWeatherConditionToTheme(condition);
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'themeEntity: ${themeEntity.toString()},theme: ${theme.toString()}';
    return '{$string}';
  }
}
