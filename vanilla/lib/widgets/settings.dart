import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Settings extends StatefulWidget {
  Settings(this._temperatureUnit, this._toggleTemperatureUnit);
  final TemperatureUnit _temperatureUnit;
  final Function _toggleTemperatureUnit;
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              value: widget._temperatureUnit == TemperatureUnit.celsius,
              onChanged: (value) => widget._toggleTemperatureUnit(value)),
        )
      ],
    );
  }
}
