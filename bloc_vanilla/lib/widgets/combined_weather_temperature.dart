import 'package:bloc_vanilla/model/models.dart' as model;
import 'package:bloc_vanilla/model/weather_response/weather_response.dart';
import 'package:bloc_vanilla/blocs/bloc_provider.dart';
import 'package:bloc_vanilla/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';

import 'package:bloc_vanilla/widgets/widgets.dart';

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
                  condition: BlocProvider.of<WeatherBloc>(context)
                      .getWeatherCondition()),
            ),
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