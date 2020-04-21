import 'package:flutter/material.dart';

import 'package:redux_example/widgets/widgets.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
    as model;

class CombinedWeatherTemperature extends StatelessWidget {
  CombinedWeatherTemperature(
      {@required model.WeatherResponse this.weatherResponse});

  final model.WeatherResponse weatherResponse;

  @override
  Widget build(BuildContext context) {
    final model.Weather _weather = weatherResponse.weatherCollection.first;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20.0),
                child: WeatherConditions(
                  condition: _weather
                      .mapConditionToWeatherCondition(_weather.condition),
                )),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Temperature(
                  _weather.temp, _weather.minTemp, _weather.maxTemp),
            ),
          ],
        ),
        Center(
            child: Text(
          weatherResponse.weatherCollection.first.formattedCondition,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        )),
      ],
    );
  }
}
