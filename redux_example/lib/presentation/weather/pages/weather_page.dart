import 'package:flutter/material.dart';
import 'package:redux_example/presentation/location_search/pages/search_page.dart';
import 'package:redux_example/presentation/settings/pages/settings_page.dart';
import 'package:redux_example/presentation/weather/widgets/weather.dart';

/// This widget functions as a container for the weather screen.
///
/// It is the initial screen which builds a scaffold and contains
/// the weather content.
class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux Weather'),
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
        backgroundColor: Theme.of(context).primaryColor,
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
