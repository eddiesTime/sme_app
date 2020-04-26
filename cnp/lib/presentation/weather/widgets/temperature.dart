import 'package:cnp/application/settings/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Temperature extends StatelessWidget {
  const Temperature(
    this.temperature,
    this.low,
    this.high,
  );

  final double temperature;
  final double low;
  final double high;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
        builder: (context, settingsNotifier, child) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              settingsNotifier.temperatureUnit == TemperatureUnit.celsius
                  ? '${_formattedTemperature(settingsNotifier.temperatureUnit, temperature)}°C'
                  : '${_formattedTemperature(settingsNotifier.temperatureUnit, temperature)}°F',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                settingsNotifier.temperatureUnit == TemperatureUnit.celsius
                    ? 'min ${_formattedTemperature(settingsNotifier.temperatureUnit, low)}°C'
                    : 'min ${_formattedTemperature(settingsNotifier.temperatureUnit, low)}°F',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
              Text(
                settingsNotifier.temperatureUnit == TemperatureUnit.celsius
                    ? 'max ${_formattedTemperature(settingsNotifier.temperatureUnit, high)}°C'
                    : 'max ${_formattedTemperature(settingsNotifier.temperatureUnit, high)}°F',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      );
    });
  }

  int _formattedTemperature(TemperatureUnit temperatureUnit, double t) {
    if (temperatureUnit == TemperatureUnit.fahrenheit) {
      final int fTemp = ((t * 9 / 5) + 32).round();
      return fTemp;
    }
    return t.round();
  }
}
