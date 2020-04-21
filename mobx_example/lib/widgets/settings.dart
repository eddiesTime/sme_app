import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/stores/temperature_store.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TemperatureStore _temperatureStore =
        Provider.of<TemperatureStore>(context);
    return Observer(builder: (_) {
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
                  value: _temperatureStore.value,
                  onChanged: (_) => _temperatureStore.toggleTemperatureUnit())),
        ],
      );
    });
  }
}
