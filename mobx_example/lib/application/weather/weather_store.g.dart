// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStore, Store {
  Computed<String> _$locationComputed;

  @override
  String get location =>
      (_$locationComputed ??= Computed<String>(() => super.location)).value;
  Computed<DateTime> _$lastUpdatedComputed;

  @override
  DateTime get lastUpdated =>
      (_$lastUpdatedComputed ??= Computed<DateTime>(() => super.lastUpdated))
          .value;
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;
  Computed<WeatherCondition> _$weatherConditionComputed;

  @override
  WeatherCondition get weatherCondition => (_$weatherConditionComputed ??=
          Computed<WeatherCondition>(() => super.weatherCondition))
      .value;

  final _$_weatherResponseFutureAtom =
      Atom(name: '_WeatherStore._weatherResponseFuture');

  @override
  ObservableFuture<WeatherResponse> get _weatherResponseFuture {
    _$_weatherResponseFutureAtom.context
        .enforceReadPolicy(_$_weatherResponseFutureAtom);
    _$_weatherResponseFutureAtom.reportObserved();
    return super._weatherResponseFuture;
  }

  @override
  set _weatherResponseFuture(ObservableFuture<WeatherResponse> value) {
    _$_weatherResponseFutureAtom.context.conditionallyRunInAction(() {
      super._weatherResponseFuture = value;
      _$_weatherResponseFutureAtom.reportChanged();
    }, _$_weatherResponseFutureAtom,
        name: '${_$_weatherResponseFutureAtom.name}_set');
  }

  final _$weatherEntityAtom = Atom(name: '_WeatherStore.weatherEntity');

  @override
  WeatherEntity get weatherEntity {
    _$weatherEntityAtom.context.enforceReadPolicy(_$weatherEntityAtom);
    _$weatherEntityAtom.reportObserved();
    return super.weatherEntity;
  }

  @override
  set weatherEntity(WeatherEntity value) {
    _$weatherEntityAtom.context.conditionallyRunInAction(() {
      super.weatherEntity = value;
      _$weatherEntityAtom.reportChanged();
    }, _$weatherEntityAtom, name: '${_$weatherEntityAtom.name}_set');
  }

  final _$getWeatherAsyncAction = AsyncAction('getWeather');

  @override
  Future<dynamic> getWeather(String location) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(location));
  }

  final _$refreshWeatherAsyncAction = AsyncAction('refreshWeather');

  @override
  Future<dynamic> refreshWeather() {
    return _$refreshWeatherAsyncAction.run(() => super.refreshWeather());
  }

  @override
  String toString() {
    final string =
        'weatherEntity: ${weatherEntity.toString()},location: ${location.toString()},lastUpdated: ${lastUpdated.toString()},state: ${state.toString()},weatherCondition: ${weatherCondition.toString()}';
    return '{$string}';
  }
}
