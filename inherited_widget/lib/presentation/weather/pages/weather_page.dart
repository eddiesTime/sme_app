import 'package:flutter/material.dart';
import 'package:inherited_widget/application/app_state.dart';
import 'package:inherited_widget/presentation/app_state_container.dart';
import 'package:inherited_widget/presentation/location_search/pages/search_page.dart';
import 'package:inherited_widget/presentation/settings/pages/settings_page.dart';
import 'package:inherited_widget/presentation/weather/widgets/weather.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppStateContainerState container = AppStateContainer.of(context);
    final AppState appState = container.appState;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Weather'),
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
        backgroundColor: appState.themeEntity.themeData.primaryColor,
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
