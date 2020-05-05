import 'package:redux_example/application/redux/model/models.dart';
import 'package:redux_example/application/redux/reducers/reducers.dart';

/// Returns the `AppState` which has all reducers combined into one.
AppState appReducer(AppState state, dynamic action) {
  return AppState(
    weatherState: weatherReducer(state.weatherState, action),
    settingsState: settingsReducer(state.settingsState, action),
    themeState: themeReducer(state.themeState, action),
    isLoading: loadingReducer(state.isLoading, action),
  );
}
