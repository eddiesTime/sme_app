import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vanilla/model/app_state.dart';

import 'package:vanilla/widgets/widgets.dart';
import 'package:vanilla/model/models.dart' as model;

class Weather extends StatefulWidget {
  // appstate
  final AppState _appState;
  final Future<void> Function() _onRefresh;
  // weather

  Weather(this._appState, this._onRefresh);

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
    return Center(child: _buildUI());
  }

  Widget _buildUI() {
    if (widget._appState.isLoading) {
      return _buildLoading();
    } else if (widget._appState.weatherResponse != null) {
      return _buildWeather();
    } else if (widget._appState.hasError) {
      return _buildError();
    }
    return _buildIdle();
  }

  Widget _buildWeather() {
    return GradientContainer(
      color: widget._appState.color,
      child: RefreshIndicator(
        onRefresh: widget._onRefresh,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child:
                    Location(location: widget._appState.weatherResponse.title),
              ),
            ),
            Center(
              child: LastUpdated(dateTime: widget._appState.lastUpdated),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                    weather: widget
                        ._appState.weatherResponse.weatherCollection.first,
                    temperatureUnit: widget._appState.temperatureUnit),
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
