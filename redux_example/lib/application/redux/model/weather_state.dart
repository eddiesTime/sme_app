import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:redux_example/domain/weather/weather_entity.dart';

part 'weather_state.freezed.dart';

@freezed
@lazySingleton
abstract class WeatherState with _$WeatherState {
  const factory WeatherState({
    @required WeatherEntity weatherEntity,
    bool isRefreshing,
  }) = _WeatherState;
  @factoryMethod
  factory WeatherState.initial({@required WeatherEntity weatherEntity}) =>
      WeatherState(weatherEntity: weatherEntity, isRefreshing: false);
  factory WeatherState.isRefreshing({@required WeatherEntity weatherEntity}) =>
      WeatherState(weatherEntity: weatherEntity, isRefreshing: true);
}
