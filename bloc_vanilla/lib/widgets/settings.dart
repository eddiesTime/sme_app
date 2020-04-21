import 'package:bloc_vanilla/blocs/bloc_provider.dart';
import 'package:bloc_vanilla/blocs/temperature_bloc/temperature_bloc.dart';
import 'package:bloc_vanilla/blocs/temperature_bloc/temperature_event.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TemperatureUnit>(
        stream: BlocProvider.of<TemperatureBloc>(context).temperatureUnit,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                        value: snapshot.data == TemperatureUnit.celsius,
                        onChanged: (value) =>
                            BlocProvider.of<TemperatureBloc>(context)
                                .temperatureEventSink
                                .add(ToggleUnit(value: value)))),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
