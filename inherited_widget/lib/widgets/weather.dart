import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inherited_widget/app_state.dart';
import 'package:inherited_widget/app_state_container.dart';
import 'package:inherited_widget/widgets/widgets.dart';

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
    final AppStateContainerState container = AppStateContainer.of(context);
    final AppState appState = container.appState;

    return Center(child: _buildUI(container, appState));
  }

  Widget _buildUI(AppStateContainerState container, AppState state) {
    print(state.city);
    if (state.isLoading) {
      print('loading');
      return _buildLoading();
    } else if (state.weatherResponse != null) {
      print('weather');
      return _buildWeather(container, state);
    } else if (state.hasError) {
      return _buildError();
    }
    print('idle');
    return _buildIdle();
  }

  Widget _buildWeather(AppStateContainerState container, AppState state) {
    return GradientContainer(
      color: state.color,
      child: RefreshIndicator(
        onRefresh: container.refreshWeather,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(location: state.weatherResponse.title),
              ),
            ),
            Center(
              child: LastUpdated(dateTime: state.lastUpdated),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                    weather: state.weatherResponse.weatherCollection.first,
                    temperatureUnit: state.temperatureUnit),
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
