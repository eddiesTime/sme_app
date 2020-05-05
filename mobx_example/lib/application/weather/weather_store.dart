import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/application/theme/theme_store.dart';
import 'package:mobx_example/domain/weather/i_weather_facade.dart';
import 'package:mobx_example/domain/weather/weather_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_store.g.dart';

/// Helps to represent the state of the WeatherStore
/// for network requests.
enum StoreState { initial, loading, hasData, hasError }

/// Used in MobX to manage the state of weather related data.
@lazySingleton
class WeatherStore extends _WeatherStore with _$WeatherStore {
  WeatherStore({
    @required IWeatherFacade weatherFacade,
    @required ThemeStore themeStore,
    @required WeatherEntity weatherEntity,
  }) : super(
          weatherFacade,
          themeStore,
          weatherEntity,
        );
}

abstract class _WeatherStore with Store {
  final IWeatherFacade _weatherFacade;
  final ThemeStore _themeStore;
  _WeatherStore(
    this._weatherFacade,
    this._themeStore,
    this.weatherEntity,
  );

  /// A MobX observable future to help represent the state of the store
  @observable
  ObservableFuture<WeatherResponse> _weatherResponseFuture;

  /// A MobX observable for `WeatherEntity`.
  @observable
  WeatherEntity weatherEntity;

  /// A MobX computed value that computes the current `location` provided by
  /// the weather entity or `null` if none is present.
  @computed
  String get location {
    return weatherEntity.weatherResponse.getOrElse(() => null).title;
  }

  /// A MobX computed value that computes the `lastUpdated` property provided by
  /// the weather entity or `null` if none is present.
  @computed
  DateTime get lastUpdated {
    return weatherEntity.lastUpdated.getOrElse(() => null);
  }

  /// A MobX computed value that computes the current `state` of the store
  /// with the current state of weather response observable future.
  @computed
  StoreState get state {
    if (_weatherResponseFuture == null) {
      return StoreState.initial;
    }
    if (_weatherResponseFuture.status == FutureStatus.rejected) {
      return StoreState.hasError;
    }
    if (_weatherResponseFuture.status == FutureStatus.pending) {
      if (weatherEntity.weatherResponse.isSome()) {
        return StoreState.hasData;
      }
      return StoreState.loading;
    }
    return StoreState.hasData;
  }

  /// A MobX computed value that computes the current `WeatherCondition` provided by
  /// the weather entity.
  @computed
  WeatherCondition get weatherCondition {
    final Weather _weather = weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weatherFacade.getWeatherConditionForWeather(weather: _weather);
  }

  /// A MobX action that signals MobX to fetch new weather data.
  ///
  /// It updates [_weatherEntity] and [_weatherResponseFuture] to match the progress.
  ///
  /// After updating the progress it calls [weatherChanged] to signal MobX that the
  /// weather has been changed and the theme needs to be updated.
  @action
  Future getWeather(String location) async {
    weatherEntity = WeatherEntity.initial();
    _weatherResponseFuture = ObservableFuture(
      _weatherFacade.getWeatherForLocation(location: location),
    );
    final WeatherResponse _wr = await _weatherResponseFuture;
    weatherEntity = WeatherEntity(
      weatherResponse: some(_wr),
      city: location,
      lastUpdated: some(DateTime.now()),
    );
    _weatherChanged();
  }

  /// A MobX action that signals MobX to refresh the weather data.
  ///
  /// It updates [_weatherEntity] and [_weatherResponseFuture] to match the progress.
  ///
  /// After updating the progress it calls [weatherChanged] to signal MobX that the
  /// weather has been changed and the theme needs to be updated.
  @action
  Future refreshWeather() async {
    _weatherResponseFuture = ObservableFuture(
        _weatherFacade.getWeatherForLocation(location: location));
    final WeatherResponse _wr = await _weatherResponseFuture;
    weatherEntity = WeatherEntity(
      weatherResponse: some(_wr),
      city: location,
      lastUpdated: some(DateTime.now()),
    );
    _weatherChanged();
  }

  /// Signals [themeStore] to update the theme to match [weatherCondition].
  void _weatherChanged() {
    _themeStore.mapWeatherConditionToTheme(weatherCondition);
  }
}
