import 'package:cnp/temperature_model.dart';
import 'package:cnp/theme_model.dart';
import 'package:cnp/weather_model.dart';
import 'package:cnp/weather_repository.dart';
import 'package:flutter/material.dart';

import 'package:cnp/pages/pages.dart';
import 'package:cnp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherModel>(
            create: (_) => WeatherModel(
                Provider.of<ThemeModel>(context), WeatherRepository())),
        ChangeNotifierProvider(
          create: (_) => TemperatureModel(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('CNP Weather'),
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
          backgroundColor: Provider.of<ThemeModel>(context).theme.primaryColor,
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
      ),
    );
  }
}
