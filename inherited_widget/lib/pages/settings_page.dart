import 'package:flutter/material.dart';
import 'package:inherited_widget/model/models.dart';
import 'package:inherited_widget/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage(this._temperatureUnit, this._toggleTemperatureUnit);
  final TemperatureUnit _temperatureUnit;
  final Function _toggleTemperatureUnit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: Settings(_temperatureUnit, _toggleTemperatureUnit));
  }
}
