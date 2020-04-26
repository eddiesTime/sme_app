import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/application/settings/settings_store.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;

  const Temperature(this.temperature, this.low, this.high);

  @override
  Widget build(BuildContext context) {
    final SettingsStore _settingsStore = Provider.of<SettingsStore>(context);
    return Observer(builder: (_) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              _settingsStore.settingsEntity.temperatureUnit ==
                      TemperatureUnit.celsius
                  ? '${_formattedTemperature(_settingsStore.settingsEntity.temperatureUnit, temperature)}°C'
                  : '${_formattedTemperature(_settingsStore.settingsEntity.temperatureUnit, temperature)}°F',
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
                _settingsStore.settingsEntity.temperatureUnit ==
                        TemperatureUnit.celsius
                    ? 'min ${_formattedTemperature(_settingsStore.settingsEntity.temperatureUnit, low)}°C'
                    : 'min ${_formattedTemperature(_settingsStore.settingsEntity.temperatureUnit, low)}°F',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
              Text(
                _settingsStore.settingsEntity.temperatureUnit ==
                        TemperatureUnit.celsius
                    ? 'max ${_formattedTemperature(_settingsStore.settingsEntity.temperatureUnit, high)}°C'
                    : 'max ${_formattedTemperature(_settingsStore.settingsEntity.temperatureUnit, high)}°F',
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
