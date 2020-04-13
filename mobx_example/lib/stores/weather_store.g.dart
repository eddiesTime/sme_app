// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStore, Store {
  Computed<String> _$cityComputed;

  @override
  String get city =>
      (_$cityComputed ??= Computed<String>(() => super.city)).value;
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

  final _$weatherResponseAtom = Atom(name: '_WeatherStore.weatherResponse');

  @override
  WeatherResponse get weatherResponse {
    _$weatherResponseAtom.context.enforceReadPolicy(_$weatherResponseAtom);
    _$weatherResponseAtom.reportObserved();
    return super.weatherResponse;
  }

  @override
  set weatherResponse(WeatherResponse value) {
    _$weatherResponseAtom.context.conditionallyRunInAction(() {
      super.weatherResponse = value;
      _$weatherResponseAtom.reportChanged();
    }, _$weatherResponseAtom, name: '${_$weatherResponseAtom.name}_set');
  }

  final _$getWeatherAsyncAction = AsyncAction('getWeather');

  @override
  Future<dynamic> getWeather(String cityName) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(cityName));
  }

  final _$refreshWeatherAsyncAction = AsyncAction('refreshWeather');

  @override
  Future<dynamic> refreshWeather() {
    return _$refreshWeatherAsyncAction.run(() => super.refreshWeather());
  }

  @override
  String toString() {
    final string =
        'weatherResponse: ${weatherResponse.toString()},city: ${city.toString()},lastUpdated: ${lastUpdated.toString()},state: ${state.toString()},weatherCondition: ${weatherCondition.toString()}';
    return '{$string}';
  }
}
