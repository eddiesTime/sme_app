import 'package:flutter_bloc_example/model/models.dart' as model;
import 'package:flutter_bloc_example/model/weather_response/weather_response.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc_example/widgets/widgets.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  CombinedWeatherTemperature({@required WeatherResponse this.weatherResponse});

  final WeatherResponse weatherResponse;

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
