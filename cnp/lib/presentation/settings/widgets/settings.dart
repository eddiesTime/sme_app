import 'package:cnp/application/settings/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// This widget contains a [Switch] to switch between
/// the measurement unit used in the weather screen.
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            value: Provider.of<SettingsNotifier>(context).temperatureUnit ==
                TemperatureUnit.celsius,
            onChanged: (_) =>
                Provider.of<SettingsNotifier>(context, listen: false)
                    .toggleTemperatureUnit(),
          ),
        )
      ],
    );
  }
}
