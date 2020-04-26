import 'package:flutter/material.dart';
import 'package:inherited_widget/application/app_state.dart';
import 'package:inherited_widget/presentation/app_state_container.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppStateContainerState container = AppStateContainer.of(context);
    final AppState appState = container.appState;

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
            value: appState.settingsEntity.temperatureUnit ==
                TemperatureUnit.celsius,
            onChanged: (_) => container.toggleTemperatureUnit(),
          ),
        )
      ],
    );
  }
}
