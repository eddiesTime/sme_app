import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_entity.freezed.dart';

@injectable
@freezed
abstract class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    @required Option<WeatherResponse> weatherResponse,
    @required String city,
    @required Option<DateTime> lastUpdated,
  }) = _WeatherEntity;

  @factoryMethod
  factory WeatherEntity.initial() => WeatherEntity(
        weatherResponse: none(),
        city: '',
        lastUpdated: none(),
      );
}
