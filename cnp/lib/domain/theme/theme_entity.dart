import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

part 'theme_entity.freezed.dart';

/// Is a domain specific model which holds the apps theme relevant data.
@injectable
@freezed
abstract class ThemeEntity implements _$ThemeEntity {
  const factory ThemeEntity(
      {@required ThemeData themeData,
      @required MaterialColor materialColor}) = _ThemeEntity;
  const ThemeEntity._();

  /// Is a `ThemeEntity` which represents the inital state.
  @factoryMethod
  factory ThemeEntity.initial() => ThemeEntity(
        themeData: ThemeData.light(),
        materialColor: Colors.lightBlue,
      );
}
