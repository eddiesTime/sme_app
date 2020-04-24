import 'package:flutter/material.dart';
import 'package:vanilla/presentation/settings/widgets/settings.dart';

import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage(this._temperatureUnit, this._toggleTemperatureUnit);
  final TemperatureUnit _temperatureUnit;
  final Function _toggleTemperatureUnit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Settings(_temperatureUnit, _toggleTemperatureUnit));
  }
}
