import 'package:flutter/material.dart';
import 'package:redux_example/redux/model/models.dart';

ThemeData themeSelector(AppState state) => state.themeState.theme;
MaterialColor colorSelector(AppState state) => state.themeState.color;
