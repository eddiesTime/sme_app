import 'package:cnp/temperature_model.dart';
import 'package:cnp/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Temperature extends StatelessWidget {
  double temperature;
  double low;
  double high;

  @override
  Widget build(BuildContext context) {
    final Weather weather = Provider.of<WeatherModel>(context, listen: false)
        .weather
        .weatherCollection
        .first;
    temperature = weather.temp;
    low = weather.minTemp;
    high = weather.maxTemp;

    return Consumer<TemperatureModel>(
        builder: (context, temperatureModel, child) {
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              temperatureModel.temperatureUnit == TemperatureUnit.celsius
                  ? '${_formattedTemperature(context, temperature)}°C'
                  : '${_formattedTemperature(context, temperature)}°F',
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
                temperatureModel.temperatureUnit == TemperatureUnit.celsius
                    ? 'min ${_formattedTemperature(context, low)}°C'
                    : 'min ${_formattedTemperature(context, low)}°F',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
              Text(
                temperatureModel.temperatureUnit == TemperatureUnit.celsius
                    ? 'max ${_formattedTemperature(context, high)}°C'
                    : 'max ${_formattedTemperature(context, high)}°F',
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

  int _formattedTemperature(BuildContext context, double t) {
    if (Provider.of<TemperatureModel>(context).temperatureUnit ==
        TemperatureUnit.fahrenheit) {
      final int fTemp = ((t * 9 / 5) + 32).round();
      return fTemp;
    }
    return t.round();
  }
}
