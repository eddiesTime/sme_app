import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class SettingsState {
  const SettingsState({@required this.temperatureUnit});

  final TemperatureUnit temperatureUnit;

  SettingsState copyWith({TemperatureUnit temperatureUnit}) {
    return SettingsState(
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
    );
  }

  dynamic toJson() => {'temperatureUnit': temperatureUnit};

  @override
  String toString() {
    return 'SettingsState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
