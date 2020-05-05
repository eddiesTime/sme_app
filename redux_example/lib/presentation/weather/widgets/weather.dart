import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/application/redux/actions/weather_actions.dart';
import 'package:redux_example/application/redux/model/models.dart';
import 'package:redux_example/application/redux/selectors/selectors.dart';
import 'package:redux_example/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:redux_example/presentation/weather/widgets/gradient_container.dart';
import 'package:redux_example/presentation/weather/widgets/last_updated.dart';
import 'package:redux_example/presentation/weather/widgets/location.dart';

/// This widget builds the content of the weather screen.
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
    return Center(
      child: StoreConnector<AppState, bool>(
          converter: (store) => store.state.isLoading,
          builder: (context, isLoading) {
            if (isLoading) {
              return _buildLoading();
            }
            return _buildUI(context);
          }),
    );
  }

  Widget _buildUI(BuildContext context) {
    return StoreConnector<AppState, WeatherState>(
      builder: (BuildContext context, WeatherState weatherState) {
        if (weatherState.weatherEntity.hasError) {
          return _buildError();
        }
        if (weatherState.weatherEntity.weatherResponse.isNone()) {
          return _buildIdle();
        }
        if (weatherState.isRefreshing) {
          return _buildWeather(context, weatherState);
        }
        _refreshCompleter?.complete();
        _refreshCompleter = Completer<void>();
        return _buildWeather(context, weatherState);
      },
      converter: (Store<AppState> store) => weatherStateSelector(store.state),
    );
  }

  Widget _buildWeather(BuildContext context, WeatherState state) {
    return StoreConnector<AppState, MaterialColor>(
        converter: (store) => colorSelector(store.state),
        builder: (context, color) {
          return GradientContainer(
              color: color,
              child: RefreshIndicator(
                onRefresh: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(const RefreshWeatherAction());
                  return _refreshCompleter.future;
                },
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: Location(
                            location: state.weatherEntity.weatherResponse
                                .getOrElse(() => null)
                                .title),
                      ),
                    ),
                    Center(
                      child: LastUpdated(
                        dateTime: state.weatherEntity.lastUpdated
                            .getOrElse(() => null),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Center(
                        child: CombinedWeatherTemperature(
                          weatherResponse: state.weatherEntity.weatherResponse
                              .getOrElse(() => null),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
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
