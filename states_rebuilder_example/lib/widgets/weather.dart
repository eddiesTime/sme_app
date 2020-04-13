import 'dart:async';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/stores/theme_store.dart';
import 'package:states_rebuilder_example/stores/weather_store.dart';
import 'package:states_rebuilder_example/widgets/widgets.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;
  ReactiveModel<ThemeStore> _reactiveThemeStoreModel;
  ReactiveModel<WeatherStore> _reactiveWeatherStoreModel;

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
    _reactiveThemeStoreModel = Injector.getAsReactive<ThemeStore>();
    _reactiveWeatherStoreModel = Injector.getAsReactive<WeatherStore>();
    return StateBuilder<WeatherStore>(
        models: [Injector.getAsReactive<WeatherStore>()],
        builder: (context, reactiveModel) {
          return reactiveModel.whenConnectionState(
              onIdle: () => _buildIdle(),
              onWaiting: () {
                return reactiveModel.state.weatherResponse != null
                    ? _buildWeather()
                    : _buildLoading();
              },
              onData: (store) {
                _refreshCompleter?.complete();
                _refreshCompleter = Completer();
                return _buildWeather();
              },
              onError: (_) => _buildError());
        });
  }

  Widget _buildWeather() {
    return GradientContainer(
      color: _reactiveThemeStoreModel.state.color,
      child: RefreshIndicator(
        onRefresh: () {
          _reactiveWeatherStoreModel
              .setState((store) => store.refreshWeather());
          return _refreshCompleter.future;
        },
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(
                    location:
                        _reactiveWeatherStoreModel.state.weatherResponse.title),
              ),
            ),
            Center(
              child: LastUpdated(
                  dateTime: _reactiveWeatherStoreModel.state.lastUpdated),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                  weatherResponse:
                      _reactiveWeatherStoreModel.state.weatherResponse,
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
