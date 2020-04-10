import 'dart:async';

import 'package:bloc_vanilla/model/weather_response/weather_response.dart';
import 'package:bloc_vanilla/blocs/bloc_provider.dart';
import 'package:bloc_vanilla/blocs/theme_bloc/theme_bloc.dart';
import 'package:bloc_vanilla/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_vanilla/widgets/widgets.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    WeatherBloc _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return StreamBuilder<WeatherResponse>(
        stream: _weatherBloc.weatherResponse,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            if (_weatherBloc.isLoading) {
              return _buildLoading();
            }
            return _buildIdle();
          }
          if (snapshot.hasData) {
            return _buildWeather(context, snapshot.data);
          }
          if (snapshot.error) {
            return _buildError();
          }
        });
  }

  Widget _buildWeather(BuildContext context, WeatherResponse data) {
    return GradientContainer(
      color: BlocProvider.of<ThemeBloc>(context).color,
      child: RefreshIndicator(
        onRefresh: BlocProvider.of<WeatherBloc>(context).refreshWeather,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(location: data.title),
              ),
            ),
            Center(
              child: LastUpdated(
                  dateTime: BlocProvider.of<WeatherBloc>(context).lastUpdated),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                  weatherResponse: data,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    return Text(
      'Something went wrong!',
      style: TextStyle(color: Colors.red),
    );
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildIdle() {
    return Center(child: Text('Please Select a Location'));
  }
}
