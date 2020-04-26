import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'theme_entity.freezed.dart';

@injectable
@freezed
abstract class ThemeEntity with _$ThemeEntity {
  const factory ThemeEntity(
      {@required ThemeData themeData,
      @required MaterialColor materialColor}) = _ThemeEntity;

  @factoryMethod
  factory ThemeEntity.initial() => ThemeEntity(
        themeData: ThemeData.light(),
        materialColor: Colors.lightBlue,
      );
}
