import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'settings_entity.freezed.dart';

@injectable
@freezed
abstract class SettingsEntity with _$SettingsEntity {
  const factory SettingsEntity({@required TemperatureUnit temperatureUnit}) =
      _SettingsEntity;
  @factoryMethod
  factory SettingsEntity.celsius() =>
      const SettingsEntity(temperatureUnit: TemperatureUnit.celsius);
  factory SettingsEntity.fahrenheit() =>
      const SettingsEntity(temperatureUnit: TemperatureUnit.fahrenheit);
}
