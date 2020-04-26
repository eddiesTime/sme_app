import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redux_example/application/redux/model/models.dart';

part 'app_state.freezed.dart';

@freezed
@lazySingleton
abstract class AppState with _$AppState {
  const factory AppState(
      {@required WeatherState weatherState,
      @required ThemeState themeState,
      @required SettingsState settingsState,
      @required bool isLoading}) = _AppState;

  @factoryMethod
  factory AppState.initial({
    @required WeatherState weatherState,
    @required ThemeState themeState,
    @required SettingsState settingsState,
  }) =>
      AppState(
        weatherState: weatherState,
        themeState: themeState,
        settingsState: settingsState,
        isLoading: false,
      );
}
