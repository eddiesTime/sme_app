import 'package:flutter/material.dart';
import 'package:redux_example/application/redux/model/app_state.dart';

/// Returns the theme data of the current theme state.
ThemeData themeSelector(AppState state) =>
    state.themeState.themeEntity.themeData;

/// Returns the material color of the current theme state.
MaterialColor colorSelector(AppState state) =>
    state.themeState.themeEntity.materialColor;
