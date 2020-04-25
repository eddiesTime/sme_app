import 'package:bloc_vanilla/presentation/settings/widgets/settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')), body: Settings());
  }
}
