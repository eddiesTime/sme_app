import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:redux_example/model/enums/enum_temperature_units.dart';

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
