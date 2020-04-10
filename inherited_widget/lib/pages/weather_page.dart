import 'package:flutter/material.dart';
import 'package:inherited_widget/app_state_container.dart';

import 'package:inherited_widget/pages/pages.dart';
import 'package:inherited_widget/widgets/widgets.dart';
import 'package:inherited_widget/app_state.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppStateContainerState container = AppStateContainer.of(context);
    final AppState appState = container.appState;

    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Weather(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appState.theme.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(),
            ),
          );
        },
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
