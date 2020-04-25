import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
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
                value: settingsState.temperatureUnit == TemperatureUnit.celsius,
                onChanged: (value) => context
                    .bloc<SettingsBloc>()
                    .add(SettingsEvent.toggleTemperatureUnit(value)),
              ),
            ),
          ],
        );
      },
    );
  }
}
