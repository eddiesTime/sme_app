import 'package:flutter/material.dart';
import 'package:vanilla/presentation/weather/widgets/temperature.dart';
import 'package:vanilla/presentation/weather/widgets/weather_conditions.dart';

import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
    as model;

class CombinedWeatherTemperature extends StatelessWidget {
  final model.Weather weather;
  final model.TemperatureUnit temperatureUnit;

  const CombinedWeatherTemperature(
      {Key key, @required this.weather, @required this.temperatureUnit})
      : assert(weather != null),
        assert(temperatureUnit != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeatherConditions(
                  condition: weather
                      .mapConditionToWeatherCondition(weather.condition)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Temperature(
                temperature: weather.temp,
                high: weather.maxTemp,
                low: weather.minTemp,
                unit: temperatureUnit,
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            weather.formattedCondition,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
