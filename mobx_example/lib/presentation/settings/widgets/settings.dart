import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/application/settings/settings_store.dart';
import 'package:provider/provider.dart';

/// This widget contains a [Switch] to switch between
/// the measurement unit used in the weather screen.
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SettingsStore _settingsStore = Provider.of<SettingsStore>(context);
    return Observer(builder: (_) {
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
              value: _settingsStore.value,
              onChanged: (_) => _settingsStore.toggleTemperatureUnit(),
            ),
          ),
        ],
      );
    });
  }
}
