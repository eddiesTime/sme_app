import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/application/stores.dart';
import 'package:mobx_example/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:mobx_example/presentation/weather/widgets/gradient_container.dart';
import 'package:mobx_example/presentation/weather/widgets/last_updated.dart';
import 'package:mobx_example/presentation/weather/widgets/location.dart';
import 'package:provider/provider.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;
  WeatherStore _weatherStore;
  ThemeStore _themeStore;

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
    _weatherStore = Provider.of<WeatherStore>(context);
    return Observer(builder: (_) {
      if (_weatherStore.state == StoreState.initial) {
        return _buildIdle();
      }
      if (_weatherStore.state == StoreState.hasError) {
        return _buildError();
      }
      if (_weatherStore.state == StoreState.loading) {
        return _buildLoading();
      }
      _refreshCompleter?.complete();
      _refreshCompleter = Completer<void>();
      return _buildWeather();
    });
  }

  Widget _buildWeather() {
    _themeStore = Provider.of<ThemeStore>(context);
    return GradientContainer(
      color: _themeStore.themeEntity.materialColor,
      child: RefreshIndicator(
        onRefresh: () {
          _weatherStore.refreshWeather();
          return _refreshCompleter.future;
        },
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(location: _weatherStore.weatherEntity.city),
              ),
            ),
            Center(
              child: LastUpdated(
                dateTime: _weatherStore.weatherEntity.lastUpdated
                    .getOrElse(() => null),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                  weatherResponse: _weatherStore.weatherEntity.weatherResponse
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
