import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Settings')), body: Settings());
  }
}
