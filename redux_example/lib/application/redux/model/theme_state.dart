import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:redux_example/domain/theme/theme_entity.dart';
import 'package:flutter/foundation.dart';

part 'theme_state.freezed.dart';

/// Represents the state of the weather data.
@freezed
@lazySingleton
abstract class ThemeState with _$ThemeState {
  @factoryMethod
  const factory ThemeState({@required ThemeEntity themeEntity}) = _ThemeState;
}
