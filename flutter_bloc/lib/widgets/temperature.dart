import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/blocs/temperature_bloc/bloc/temperature_bloc.dart';
import 'package:flutter_bloc_example/model/enums/enum_temperature_units.dart';

class Temperature extends StatelessWidget {
  double temperature;
  double low;
  double high;

  Temperature(this.temperature, this.low, this.high);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemperatureBloc, TemperatureState>(
        builder: (context, state) {
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              state.temperatureUnit == TemperatureUnit.celsius
                  ? '${_formattedTemperature(state.temperatureUnit, temperature)}°C'
                  : '${_formattedTemperature(state.temperatureUnit, temperature)}°F',
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
                state.temperatureUnit == TemperatureUnit.celsius
                    ? 'min ${_formattedTemperature(state.temperatureUnit, low)}°C'
                    : 'min ${_formattedTemperature(state.temperatureUnit, low)}°F',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
              Text(
                state.temperatureUnit == TemperatureUnit.celsius
                    ? 'max ${_formattedTemperature(state.temperatureUnit, high)}°C'
                    : 'max ${_formattedTemperature(state.temperatureUnit, high)}°F',
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
