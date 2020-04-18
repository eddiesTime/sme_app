import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/redux/middleware/middleware.dart';
import 'package:redux_example/redux/model/models.dart';
import 'package:redux_example/redux/reducers/app_state_reducer.dart';
import 'package:redux_example/redux_app.dart';
import 'package:redux_example/weather_repository.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: createWeatherMiddleware(WeatherRepository()));

  runApp(StoreProvider(store: store, child: ReduxApp()));
}
