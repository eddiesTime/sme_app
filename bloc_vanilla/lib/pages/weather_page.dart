import 'package:bloc_vanilla/blocs/bloc_provider.dart';
import 'package:bloc_vanilla/blocs/temperature_bloc/temperature_bloc.dart';
import 'package:bloc_vanilla/blocs/theme_bloc/theme_bloc.dart';
import 'package:bloc_vanilla/weather_repository.dart';
import 'package:bloc_vanilla/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';

import 'package:bloc_vanilla/pages/pages.dart';
import 'package:bloc_vanilla/widgets/widgets.dart';

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
        title: Text('Vanilla_Bloc Weather'),
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
