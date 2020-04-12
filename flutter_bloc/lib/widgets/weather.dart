import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/theme_bloc/bloc/theme_bloc.dart';
import 'package:flutter_bloc_example/blocs/weather_bloc/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/widgets/widgets.dart';
import 'package:flutter_bloc_example/model/models.dart' as model;

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
    return BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
      if (state is WeatherLoaded) {
        final model.Weather _weather =
            state.weatherResponse.weatherCollection.first;
        BlocProvider.of<ThemeBloc>(context).add(WeatherChanged(
            condition:
                _weather.mapConditionToWeatherCondition(_weather.condition)));
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
      }
    }, builder: (context, state) {
      if (state is WeatherLoadingFailure) {
        return _buildError();
      }
      if (state is WeatherLoading) {
        return _buildLoading();
      }
      if (state is WeatherLoaded) {
        return _buildWeather(context, state);
      }
      return _buildIdle();
    });
  }

  Widget _buildWeather(BuildContext context, WeatherLoaded state) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return GradientContainer(
        color: themeState.color,
        child: RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<WeatherBloc>(context).add(RefreshWeather());
            return _refreshCompleter.future;
          },
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
                    weatherResponse: state.weatherResponse,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
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
