import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/stores/theme_store.dart';
import 'package:mobx_example/weather_repository.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_store.g.dart';

enum StoreState { initial, loading, hasData, hasError }

class WeatherStore extends _WeatherStore with _$WeatherStore {
  WeatherStore(
      {@required WeatherRepository weatherRepo,
      @required ThemeStore themeStore})
      : super(weatherRepo, themeStore);
}

abstract class _WeatherStore with Store {
  final WeatherRepository _weatherRepo;
  final ThemeStore _themeStore;
  _WeatherStore(this._weatherRepo, this._themeStore);

  @observable
  ObservableFuture<WeatherResponse> _weatherResponseFuture;

  @observable
  WeatherResponse weatherResponse;

  @computed
  String get city {
    if (weatherResponse != null) {
      return weatherResponse.title;
    }
  }

  @computed
  DateTime get lastUpdated {
    if (weatherResponse != null) {
      return DateTime.now();
    }
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
      if (weatherResponse != null) {
        return StoreState.hasData;
      }
      return StoreState.loading;
    }
    return StoreState.hasData;
  }

  @computed
  WeatherCondition get weatherCondition {
    if (weatherResponse != null) {
      final Weather _weather = weatherResponse.weatherCollection.first;
      return _weather.mapConditionToWeatherCondition(_weather.condition);
    }
  }

  @action
  Future getWeather(String cityName) async {
    weatherResponse = null;
    _weatherResponseFuture =
        ObservableFuture(_weatherRepo.getWeatherFor(city: cityName));
    weatherResponse = await _weatherResponseFuture;
    _weatherChanged();
  }

  @action
  Future refreshWeather() async {
    _weatherResponseFuture =
        ObservableFuture(_weatherRepo.getWeatherFor(city: city));
    weatherResponse = await _weatherResponseFuture;
    _weatherChanged();
  }

  void _weatherChanged() {
    _themeStore.mapWeatherConditionToTheme(weatherCondition);
  }
}
