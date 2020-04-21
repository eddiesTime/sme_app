import 'package:cnp/temperature_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            'Temperature Units',
          ),
          isThreeLine: true,
          subtitle:
              Text('Use metric measurements (celsius) for temperature units.'),
          trailing: Switch(
              value: Provider.of<TemperatureModel>(context).temperatureUnit ==
                  TemperatureUnit.celsius,
              onChanged: (value) =>
                  Provider.of<TemperatureModel>(context, listen: false)
                      .toggleTemperatureUnit(value)),
        )
      ],
    );
  }
}
