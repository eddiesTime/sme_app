import 'package:bloc_vanilla/application/settings/settings_bloc.dart';
import 'package:bloc_vanilla/injection.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// This widget contains a [Switch] to switch between
/// the measurement unit used in the weather screen.
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Gets a reference to the SettingsBloc instance.
    final SettingsBloc _settingsBloc = getIt<SettingsBloc>();
    // Rebuilds whenever a new TemperatureUnit is added to the stream.
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
                    // Adds an event to the settings event sink.
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
