import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'weather_entity.freezed.dart';

/// Is a domain specific model which holds the apps weather relevant data.
@injectable
@freezed
abstract class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    @required Option<WeatherResponse> weatherResponse,
    @required String city,
    @required bool hasError,
    @required Option<DateTime> lastUpdated,
    @required bool isLoading,
  }) = _WeatherEntity;

  /// Is a `WeatherEntity` which represents the initial state of the entity.
  @factoryMethod
  factory WeatherEntity.initial() => WeatherEntity(
        weatherResponse: none(),
        city: '',
        hasError: false,
        lastUpdated: none(),
        isLoading: false,
      );

  /// Is a `WeatherEntity` which represents a loading state of this entity.
  factory WeatherEntity.loading() => WeatherEntity(
        weatherResponse: none(),
        city: '',
        hasError: false,
        lastUpdated: none(),
        isLoading: true,
      );

  /// Is a `WeatherEntity` which represents the state when an loading failure occured.
  factory WeatherEntity.loadingFailure() => WeatherEntity(
        weatherResponse: none(),
        city: '',
        hasError: true,
        lastUpdated: none(),
        isLoading: false,
      );
}
