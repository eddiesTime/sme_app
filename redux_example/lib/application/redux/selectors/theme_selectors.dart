import 'package:flutter/material.dart';
import 'package:redux_example/application/redux/model/app_state.dart';

ThemeData themeSelector(AppState state) =>
    state.themeState.themeEntity.themeData;
MaterialColor colorSelector(AppState state) =>
    state.themeState.themeEntity.materialColor;
