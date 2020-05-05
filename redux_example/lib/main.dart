import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:injectable/injectable.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/application/redux/middleware/weather_middleware.dart';
import 'package:redux_example/application/redux/reducers/app_state_reducer.dart';
import 'package:redux_example/domain/weather/i_weather_facade.dart';
import 'package:redux_example/injection.dart';
import 'package:redux_example/presentation/redux_app.dart';

import 'application/redux/model/app_state.dart';

void main() {
  // Initialises the code generation for [get_it].
  configureInjection(Environment.prod);
  // Initialise the Redux store.
  final store = Store<AppState>(
    appReducer,
    initialState: getIt<AppState>(),
    middleware: createWeatherMiddleware(
      getIt<IWeatherFacade>(),
    ),
  );

  runApp(
    StoreProvider(
      store: store,
      child: ReduxApp(),
    ),
  );
}
