import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:redux_example/domain/weather/weather_entity.dart';

part 'weather_state.freezed.dart';

/// Represents the state of the weather data.
@freezed
@lazySingleton
abstract class WeatherState with _$WeatherState {
  const factory WeatherState({
    @required WeatherEntity weatherEntity,
    bool isRefreshing,
  }) = _WeatherState;

  /// Represents the initial state of the weather data.
  @factoryMethod
  factory WeatherState.initial({@required WeatherEntity weatherEntity}) =>
      WeatherState(weatherEntity: weatherEntity, isRefreshing: false);

  /// Represents the state of weather data when it is refreshing.
  factory WeatherState.isRefreshing({@required WeatherEntity weatherEntity}) =>
      WeatherState(weatherEntity: weatherEntity, isRefreshing: true);
}
