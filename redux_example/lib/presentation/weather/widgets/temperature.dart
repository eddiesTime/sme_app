import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/application/redux/model/app_state.dart';
import 'package:redux_example/application/redux/selectors/settings_selector.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;

  const Temperature(this.temperature, this.low, this.high);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TemperatureUnit>(
        converter: (store) => temperatureUnitSelector(store.state),
        builder: (context, tempUnit) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  tempUnit == TemperatureUnit.celsius
                      ? '${_formattedTemperature(tempUnit, temperature)}°C'
                      : '${_formattedTemperature(tempUnit, temperature)}°F',
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
                    tempUnit == TemperatureUnit.celsius
                        ? 'min ${_formattedTemperature(tempUnit, low)}°C'
                        : 'min ${_formattedTemperature(tempUnit, low)}°F',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    tempUnit == TemperatureUnit.celsius
                        ? 'max ${_formattedTemperature(tempUnit, high)}°C'
                        : 'max ${_formattedTemperature(tempUnit, high)}°F',
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
