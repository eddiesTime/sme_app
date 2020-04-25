import 'package:bloc_vanilla/application/weather/weather_bloc.dart';
import 'package:bloc_vanilla/injection.dart';
import 'package:bloc_vanilla/presentation/weather/widgets/temperature.dart';
import 'package:bloc_vanilla/presentation/weather/widgets/weather_conditions.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
    as model;

class CombinedWeatherTemperature extends StatelessWidget {
  const CombinedWeatherTemperature({@required this.weatherResponse});

  final model.WeatherResponse weatherResponse;

  @override
  Widget build(BuildContext context) {
    final model.Weather _weather = weatherResponse.weatherCollection.first;
    final WeatherBloc _weatherBloc = getIt<WeatherBloc>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeatherConditions(
                condition: _weatherBloc.getWeatherCondition(
                    weatherResponse: weatherResponse),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Temperature(
                _weather.temp,
                _weather.minTemp,
                _weather.maxTemp,
              ),
            ),
          ],
        ),
        Center(
            child: Text(
          _weather.formattedCondition,
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
