import 'package:redux_example/redux/model/models.dart';
import 'package:redux_example/redux/reducers/reducers.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      weatherState: weatherReducer(state.weatherState, action),
      settingsState: settingsReducer(state.settingsState, action),
      themeState: themeReducer(state.themeState, action),
      isLoading: loadingReducer(state.isLoading, action));
}
