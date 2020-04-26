import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/application/redux/model/app_state.dart';
import 'package:redux_example/application/redux/selectors/theme_selectors.dart';
import 'package:redux_example/presentation/weather/pages/weather_page.dart';

class ReduxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ThemeData>(
      builder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          home: WeatherPage(),
        );
      },
      converter: (Store<AppState> store) => themeSelector(store.state),
    );
  }
}
