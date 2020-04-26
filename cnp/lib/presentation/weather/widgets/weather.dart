import 'dart:async';
import 'package:cnp/application/theme/theme_notifier.dart';
import 'package:cnp/application/weather/weather_notifier.dart';
import 'package:cnp/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:cnp/presentation/weather/widgets/gradient_container.dart';
import 'package:cnp/presentation/weather/widgets/last_updated.dart';
import 'package:cnp/presentation/weather/widgets/location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;
  WeatherNotifier _weatherNotifier;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    _weatherNotifier = Provider.of<WeatherNotifier>(context, listen: false);
    return Center(child: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    return Consumer<WeatherNotifier>(
        builder: (context, weatherNotifier, child) {
      if (weatherNotifier.weatherEntity.isLoading) {
        return _buildLoading();
      }
      if (weatherNotifier.weatherEntity.hasError) {
        return _buildError();
      }
      if (weatherNotifier.weatherEntity.weatherResponse.isNone()) {
        return _buildIdle();
      }
      _refreshCompleter?.complete();
      _refreshCompleter = Completer<void>();
      return _buildWeather(context);
    });
  }

  Widget _buildWeather(BuildContext context) {
    return GradientContainer(
      color: Provider.of<ThemeNotifier>(context).color,
      child: RefreshIndicator(
        onRefresh: () => _weatherNotifier.refreshWeatherForLocation(
            location: _weatherNotifier.weatherEntity.city),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(
                  location: _weatherNotifier.weatherEntity.weatherResponse
                      .getOrElse(() => null)
                      .title,
                ),
              ),
            ),
            Center(
              child: LastUpdated(
                dateTime: _weatherNotifier.weatherEntity.lastUpdated
                    .getOrElse(() => null),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(
                  weatherResponse: _weatherNotifier
                      .weatherEntity.weatherResponse
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
