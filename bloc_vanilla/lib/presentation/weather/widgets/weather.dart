import 'dart:async';

import 'package:bloc_vanilla/application/theme/theme_bloc.dart';
import 'package:bloc_vanilla/application/weather/weather_bloc.dart';
import 'package:bloc_vanilla/domain/theme/theme_entity.dart';
import 'package:bloc_vanilla/domain/weather/weather_entity.dart';
import 'package:bloc_vanilla/injection.dart';
import 'package:bloc_vanilla/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:bloc_vanilla/presentation/weather/widgets/gradient_container.dart';
import 'package:bloc_vanilla/presentation/weather/widgets/last_updated.dart';
import 'package:bloc_vanilla/presentation/weather/widgets/location.dart';
import 'package:flutter/material.dart';

/// This widget builds the content of the weather screen.
class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;
  // A reference to allow use without context locally.
  WeatherBloc _weatherBloc;

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
    // Gets the reference to the WeatherBloc instance.
    _weatherBloc = getIt<WeatherBloc>();
    // Rebuilds the weather content whenever a new WeatherEntity is received in the stream.
    return StreamBuilder<WeatherEntity>(
      stream: _weatherBloc.weatherEntity,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _buildIdle();
        } else {
          if (snapshot.data.isLoading) {
            return _buildLoading();
          }
          if (snapshot.data.hasError) {
            return _buildError();
          }
          _refreshCompleter?.complete();
          _refreshCompleter = Completer<void>();
          return _buildWeather(snapshot.data);
        }
      },
    );
  }

  Widget _buildWeather(WeatherEntity weatherEntity) {
    // Gets the reference to the ThemeBloc instance.
    final ThemeBloc _themeBloc = getIt<ThemeBloc>();
    // Rebuilds the GradientContainer whenever a new ThemeEntity is added to the stream to match weather condition.
    return StreamBuilder<ThemeEntity>(
        stream: _themeBloc.themeEntity,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GradientContainer(
              color: snapshot.data.materialColor,
              child: RefreshIndicator(
                onRefresh: () {
                  _weatherBloc.weatherEventSink
                      .add(RefreshWeather(location: weatherEntity.city));
                  return _refreshCompleter.future;
                },
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: Location(
                          location: weatherEntity.weatherResponse
                              .getOrElse(() => null)
                              .title,
                        ),
                      ),
                    ),
                    Center(
                      child: LastUpdated(
                        dateTime:
                            weatherEntity.lastUpdated.getOrElse(() => null),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Center(
                        child: CombinedWeatherTemperature(
                          weatherResponse: weatherEntity.weatherResponse
                              .getOrElse(() => null),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }

  Widget _buildError() {
    return const Text(
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
