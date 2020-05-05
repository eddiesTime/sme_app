import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/application/redux/actions/settings_actions.dart';
import 'package:redux_example/application/redux/model/models.dart';
import 'package:redux_example/application/redux/selectors/settings_selector.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

/// This widget contains a [Switch] to switch between
/// the measurement unit used in the weather screen.
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsState>(
        converter: (store) => settingsStateSelector(store.state),
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
                  value: settingsState.settingsEntity.temperatureUnit ==
                      TemperatureUnit.celsius,
                  onChanged: (_) =>
                      StoreProvider.of<AppState>(context).dispatch(
                    const ToggleTemperatureUnitAction(),
                  ),
                ),
              )
            ],
          );
        });
  }
}
