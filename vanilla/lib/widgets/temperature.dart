import 'package:flutter/material.dart';
import 'package:vanilla/model/enum_temperature_units.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;
  final TemperatureUnit unit;

  Temperature({Key key, this.temperature, this.low, this.high, this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            unit == TemperatureUnit.celsius
                ? '${_formattedTemperature(temperature)}°C'
                : '${_formattedTemperature(temperature)}°F',
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
              unit == TemperatureUnit.celsius
                  ? 'min ${_formattedTemperature(low)}°C'
                  : 'min ${_formattedTemperature(low)}°F',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
            Text(
              unit == TemperatureUnit.celsius
                  ? 'max ${_formattedTemperature(high)}°C'
                  : 'max ${_formattedTemperature(high)}°F',
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
  }

  int _formattedTemperature(double t) {
    if (unit == TemperatureUnit.fahrenheit) {
      final int fTemp = ((t * 9 / 5) + 32).round();
      return fTemp;
    }
    return t.round();
  }
}
