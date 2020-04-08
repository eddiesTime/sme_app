import 'package:cnp/weather_model.dart';
import 'package:flutter/material.dart';

import 'package:cnp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: WeatherConditions(
                  condition: Provider.of<WeatherModel>(context, listen: false)
                      .getWeatherCondition()),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Temperature(),
            ),
          ],
        ),
        Center(
          child: Text(
            Provider.of<WeatherModel>(context, listen: false)
                .weather
                .weatherCollection
                .first
                .formattedCondition,
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
