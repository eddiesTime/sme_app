import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/pages/pages.dart';
import 'package:redux_example/redux/model/models.dart';
import 'package:redux_example/redux/selectors/selectors.dart';

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
        converter: (Store<AppState> store) => themeSelector(store.state));
    // return MaterialApp(
    //     title: 'Flutter Demo', theme: theme, home: WeatherPage());
  }
}
