// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStore, Store {
  final _$themeAtom = Atom(name: '_ThemeStore.theme');

  @override
  ThemeData get theme {
    _$themeAtom.context.enforceReadPolicy(_$themeAtom);
    _$themeAtom.reportObserved();
    return super.theme;
  }

  @override
  set theme(ThemeData value) {
    _$themeAtom.context.conditionallyRunInAction(() {
      super.theme = value;
      _$themeAtom.reportChanged();
    }, _$themeAtom, name: '${_$themeAtom.name}_set');
  }

  final _$colorAtom = Atom(name: '_ThemeStore.color');

  @override
  MaterialColor get color {
    _$colorAtom.context.enforceReadPolicy(_$colorAtom);
    _$colorAtom.reportObserved();
    return super.color;
  }

  @override
  set color(MaterialColor value) {
    _$colorAtom.context.conditionallyRunInAction(() {
      super.color = value;
      _$colorAtom.reportChanged();
    }, _$colorAtom, name: '${_$colorAtom.name}_set');
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
    final string = 'theme: ${theme.toString()},color: ${color.toString()}';
    return '{$string}';
  }
}
