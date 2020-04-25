import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/application/settings/settings_store.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;

  const Temperature(this.temperature, this.low, this.high);

  @override
  Widget build(BuildContext context) {
    return StateBuilder<SettingsStore>(
        models: [Injector.getAsReactive<SettingsStore>()],
        builder: (context, reactiveModel) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  reactiveModel.state.settingsEntity.temperatureUnit ==
                          TemperatureUnit.celsius
                      ? '${_formattedTemperature(reactiveModel.state.settingsEntity.temperatureUnit, temperature)}°C'
                      : '${_formattedTemperature(reactiveModel.state.settingsEntity.temperatureUnit, temperature)}°F',
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
                    reactiveModel.state.settingsEntity.temperatureUnit ==
                            TemperatureUnit.celsius
                        ? 'min ${_formattedTemperature(reactiveModel.state.settingsEntity.temperatureUnit, low)}°C'
                        : 'min ${_formattedTemperature(reactiveModel.state.settingsEntity.temperatureUnit, low)}°F',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    reactiveModel.state.settingsEntity.temperatureUnit ==
                            TemperatureUnit.celsius
                        ? 'max ${_formattedTemperature(reactiveModel.state.settingsEntity.temperatureUnit, high)}°C'
                        : 'max ${_formattedTemperature(reactiveModel.state.settingsEntity.temperatureUnit, high)}°F',
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
