import 'package:bloc_vanilla/application/settings/settings_bloc.dart';
import 'package:bloc_vanilla/injection.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SettingsBloc _settingsBloc = getIt<SettingsBloc>();
    return StreamBuilder<TemperatureUnit>(
        stream: _settingsBloc.temperatureUnit,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'Temperature Units',
                  ),
                  isThreeLine: true,
                  subtitle: const Text(
                      'Use metric measurements (celsius) for temperature units.'),
                  trailing: Switch(
                    value: snapshot.data == TemperatureUnit.celsius,
                    onChanged: (value) => _settingsBloc.settingsEventSink.add(
                      ToggleTemperatureUnit(value),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
