import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'theme_actions.freezed.dart';

@freezed
abstract class ThemeActions with _$ThemeActions {
  const factory ThemeActions.setThemeAction(
      {@required WeatherCondition weatherCondition}) = SetThemeAction;
}
