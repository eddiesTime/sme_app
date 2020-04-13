import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/model/enums/enum_temperature_units.dart';
import 'package:states_rebuilder_example/stores/temperature_store.dart';

class Temperature extends StatelessWidget {
  double temperature;
  double low;
  double high;

  Temperature(this.temperature, this.low, this.high);

  @override
  Widget build(BuildContext context) {
    return StateBuilder<TemperatureStore>(
        models: [Injector.getAsReactive<TemperatureStore>()],
        builder: (context, reactiveModel) {
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  reactiveModel.state.temperatureUnit == TemperatureUnit.celsius
                      ? '${_formattedTemperature(reactiveModel.state.temperatureUnit, temperature)}°C'
                      : '${_formattedTemperature(reactiveModel.state.temperatureUnit, temperature)}°F',
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
                    reactiveModel.state.temperatureUnit ==
                            TemperatureUnit.celsius
                        ? 'min ${_formattedTemperature(reactiveModel.state.temperatureUnit, low)}°C'
                        : 'min ${_formattedTemperature(reactiveModel.state.temperatureUnit, low)}°F',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    reactiveModel.state.temperatureUnit ==
                            TemperatureUnit.celsius
                        ? 'max ${_formattedTemperature(reactiveModel.state.temperatureUnit, high)}°C'
                        : 'max ${_formattedTemperature(reactiveModel.state.temperatureUnit, high)}°F',
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
