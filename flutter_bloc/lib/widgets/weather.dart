import 'dart:async';

import 'package:cnp/theme_model.dart';
import 'package:cnp/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:cnp/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
    return Consumer<WeatherModel>(builder: (context, weatherModel, child) {
      if (weatherModel.isLoading) {
        return _buildLoading();
      } else if (weatherModel.weather != null) {
        return _buildWeather(context);
      } else if (weatherModel.hasError) {
        return _buildError();
      }
      return _buildIdle();
    });
  }

  Widget _buildWeather(BuildContext context) {
    return GradientContainer(
      color: Provider.of<ThemeModel>(context).color,
      child: RefreshIndicator(
        onRefresh:
            Provider.of<WeatherModel>(context, listen: false).refreshWeather,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child: Location(
                    location: Provider.of<WeatherModel>(context, listen: false)
                        .weather
                        .title),
              ),
            ),
            Center(
              child: LastUpdated(
                  dateTime: Provider.of<WeatherModel>(context, listen: false)
                      .lastUpdated),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: CombinedWeatherTemperature(),
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
