import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/application/theme/theme_store.dart';
import 'package:mobx_example/domain/weather/i_weather_facade.dart';
import 'package:mobx_example/domain/weather/weather_entity.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_store.g.dart';

enum StoreState { initial, loading, hasData, hasError }

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

  @observable
  ObservableFuture<WeatherResponse> _weatherResponseFuture;

  @observable
  WeatherEntity weatherEntity;

  @computed
  String get location {
    return weatherEntity.weatherResponse.getOrElse(() => null).title;
  }

  @computed
  DateTime get lastUpdated {
    return weatherEntity.lastUpdated.getOrElse(() => null);
  }

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

  @computed
  WeatherCondition get weatherCondition {
    final Weather _weather = weatherEntity.weatherResponse
        .getOrElse(() => null)
        .weatherCollection
        .first;
    return _weatherFacade.getWeatherConditionForWeather(weather: _weather);
  }

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

  void _weatherChanged() {
    _themeStore.mapWeatherConditionToTheme(weatherCondition);
  }
}
