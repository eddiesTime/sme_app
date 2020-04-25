import 'dart:async';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/application/theme/theme_store.dart';
import 'package:states_rebuilder_example/application/weather/weather_store.dart';
import 'package:states_rebuilder_example/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:states_rebuilder_example/presentation/weather/widgets/gradient_container.dart';
import 'package:states_rebuilder_example/presentation/weather/widgets/last_updated.dart';
import 'package:states_rebuilder_example/presentation/weather/widgets/location.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;
  final ReactiveModel<ThemeStore> _reactiveThemeStoreModel =
      Injector.getAsReactive<ThemeStore>();
  final ReactiveModel<WeatherStore> _reactiveWeatherStoreModel =
      Injector.getAsReactive<WeatherStore>();

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
    return StateBuilder<WeatherStore>(
        models: [_reactiveWeatherStoreModel],
        builder: (context, reactiveModel) {
          return reactiveModel.whenConnectionState(
              onIdle: () => _buildIdle(),
              onWaiting: () {
                return reactiveModel.state.weatherEntity.weatherResponse
                        .isSome()
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
      color: _reactiveThemeStoreModel.state.themeEntity.materialColor,
      child: RefreshIndicator(
        onRefresh: () {
          _reactiveWeatherStoreModel.setState(
            (store) =>
                store.refreshWeatherForLocation(store.weatherEntity.city),
          );
          return _refreshCompleter.future;
        },
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(
                    location: _reactiveWeatherStoreModel
                        .state.weatherEntity.weatherResponse
                        .getOrElse(() => null)
                        .title),
              ),
            ),
            Center(
                child: LastUpdated(
              dateTime: _reactiveWeatherStoreModel
                  .state.weatherEntity.lastUpdated
                  .getOrElse(() => null),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                  weatherResponse: _reactiveWeatherStoreModel
                      .state.weatherEntity.weatherResponse
                      .getOrElse(() => null),
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
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildIdle() {
    return const Center(child: Text('Please Select a Location'));
  }
}
