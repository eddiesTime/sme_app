import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/application/settings/settings_store.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// This widget contains a [Switch] to switch between
/// the measurement unit used in the weather screen.
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateBuilder<SettingsStore>(
        models: [Injector.getAsReactive<SettingsStore>()],
        builder: (context, reactiveModel) {
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
                  value: reactiveModel.state.settingsEntity.temperatureUnit ==
                      TemperatureUnit.celsius,
                  onChanged: (_) => reactiveModel
                      .setState((store) => store.toggleTemperatureUnit()),
                ),
              ),
            ],
          );
        });
  }
}
