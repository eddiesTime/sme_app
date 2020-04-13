import 'package:flutter/material.dart';

import 'package:states_rebuilder_example/pages/pages.dart';
import 'package:states_rebuilder_example/widgets/widgets.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // WeatherBloc _weatherBloc;
  // TemperatureBloc _temperatureBloc;

  // @override
  // void initState() {
  //   super.initState();
  //   _temperatureBloc = TemperatureBloc();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('States_Rebuilder Weather'),
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

  // @override
  // void dispose() {
  //   _temperatureBloc.dispose();
  //   _weatherBloc.dispose();
  //   super.dispose();
  // }
}
