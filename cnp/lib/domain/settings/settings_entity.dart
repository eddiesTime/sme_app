import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'settings_entity.freezed.dart';

/// Is a domain specific model which holds the apps settings relevant data.
@injectable
@freezed
abstract class SettingsEntity with _$SettingsEntity {
  /// Holds a `TemperatureUnit` which represents what type of measurement unit it is.
  const factory SettingsEntity({@required TemperatureUnit temperatureUnit}) =
      _SettingsEntity;

  /// Is a `SettingsEntity` which holds a reference to the measurement unit type `celsius`.
  @factoryMethod
  factory SettingsEntity.celsius() =>
      const SettingsEntity(temperatureUnit: TemperatureUnit.celsius);

  /// Is a `SettingsEntity` which holds a reference to the measurement unit type `fahrenheit`.
  factory SettingsEntity.fahrenheit() =>
      const SettingsEntity(temperatureUnit: TemperatureUnit.fahrenheit);
}
