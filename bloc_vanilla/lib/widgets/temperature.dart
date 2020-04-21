import 'package:bloc_vanilla/blocs/bloc_provider.dart';
import 'package:bloc_vanilla/blocs/temperature_bloc/temperature_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Temperature extends StatelessWidget {
  double temperature;
  double low;
  double high;

  Temperature(this.temperature, this.low, this.high);

  @override
  Widget build(BuildContext context) {
    TemperatureBloc _temperatureBloc =
        BlocProvider.of<TemperatureBloc>(context);
    return StreamBuilder<TemperatureUnit>(
        stream: _temperatureBloc.temperatureUnit,
        builder: (context, snapshot) {
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  snapshot.data == TemperatureUnit.celsius
                      ? '${_formattedTemperature(snapshot.data, temperature)}°C'
                      : '${_formattedTemperature(snapshot.data, temperature)}°F',
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
                    snapshot.data == TemperatureUnit.celsius
                        ? 'min ${_formattedTemperature(snapshot.data, low)}°C'
                        : 'min ${_formattedTemperature(snapshot.data, low)}°F',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    snapshot.data == TemperatureUnit.celsius
                        ? 'max ${_formattedTemperature(snapshot.data, high)}°C'
                        : 'max ${_formattedTemperature(snapshot.data, high)}°F',
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
