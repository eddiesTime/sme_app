import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/redux/actions/settings_actions.dart';
import 'package:redux_example/redux/model/models.dart';
import 'package:redux_example/redux/selectors/selectors.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsState>(
        converter: (store) => settingsStateSelector(store.state),
        builder: (context, settingsState) {
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
                  value:
                      settingsState.temperatureUnit == TemperatureUnit.celsius,
                  onChanged: (_) => StoreProvider.of<AppState>(context)
                      .dispatch(ToggleTemperatureUnitAction()),
                ),
              )
            ],
          );
        });
  }
}
