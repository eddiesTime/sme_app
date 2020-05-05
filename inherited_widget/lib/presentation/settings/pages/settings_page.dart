import 'package:flutter/material.dart';
import 'package:inherited_widget/presentation/settings/widgets/settings.dart';

/// This widget functions as a container for the settings screen.
///
/// It builds a scaffold and contains the settings content.
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
