import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/model/enums/enum_temperature_units.dart';
import 'package:states_rebuilder_example/stores/temperature_store.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateBuilder<TemperatureStore>(
        models: [Injector.getAsReactive<TemperatureStore>()],
        builder: (context, reactiveModel) {
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
                      value: reactiveModel.state.temperatureUnit ==
                          TemperatureUnit.celsius,
                      onChanged: (_) => reactiveModel
                          .setState((store) => store.toggleTemperatureUnit()))),
            ],
          );
        });
  }
}
