import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/temperature_bloc/bloc/temperature_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemperatureBloc, TemperatureState>(
        builder: (context, temperatureState) {
      return ListView(
        children: <Widget>[
          ListTile(
              title: Text(
                'Temperature Units',
              ),
              isThreeLine: true,
              subtitle: Text(
                  'Use metric measurements (celsius) for temperature units.'),
              trailing: Switch(
                  value: temperatureState.temperatureUnit ==
                      TemperatureUnit.celsius,
                  onChanged: (_) => BlocProvider.of<TemperatureBloc>(context)
                      .add(ToggleUnit()))),
        ],
      );
    });
  }
}
