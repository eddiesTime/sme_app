import 'package:flutter/material.dart';
import 'package:redux_example/presentation/settings/widgets/settings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Settings(),
    );
  }
}
