// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call(
      {@required WeatherState weatherState,
      @required ThemeState themeState,
      @required SettingsState settingsState,
      @required bool isLoading}) {
    return _AppState(
      weatherState: weatherState,
      themeState: themeState,
      settingsState: settingsState,
      isLoading: isLoading,
    );
  }
}

// ignore: unused_element
const $AppState = _$AppStateTearOff();

mixin _$AppState {
  WeatherState get weatherState;
  ThemeState get themeState;
  SettingsState get settingsState;
  bool get isLoading;

  $AppStateCopyWith<AppState> get copyWith;
}

abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {WeatherState weatherState,
      ThemeState themeState,
      SettingsState settingsState,
      bool isLoading});

  $WeatherStateCopyWith<$Res> get weatherState;
  $ThemeStateCopyWith<$Res> get themeState;
  $SettingsStateCopyWith<$Res> get settingsState;
}

class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object weatherState = freezed,
    Object themeState = freezed,
    Object settingsState = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      weatherState: weatherState == freezed
          ? _value.weatherState
          : weatherState as WeatherState,
      themeState:
          themeState == freezed ? _value.themeState : themeState as ThemeState,
      settingsState: settingsState == freezed
          ? _value.settingsState
          : settingsState as SettingsState,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }

  @override
  $WeatherStateCopyWith<$Res> get weatherState {
    if (_value.weatherState == null) {
      return null;
    }
    return $WeatherStateCopyWith<$Res>(_value.weatherState, (value) {
      return _then(_value.copyWith(weatherState: value));
    });
  }

  @override
  $ThemeStateCopyWith<$Res> get themeState {
    if (_value.themeState == null) {
      return null;
    }
    return $ThemeStateCopyWith<$Res>(_value.themeState, (value) {
      return _then(_value.copyWith(themeState: value));
    });
  }

  @override
  $SettingsStateCopyWith<$Res> get settingsState {
    if (_value.settingsState == null) {
      return null;
    }
    return $SettingsStateCopyWith<$Res>(_value.settingsState, (value) {
      return _then(_value.copyWith(settingsState: value));
    });
  }
}

abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) =
      __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {WeatherState weatherState,
      ThemeState themeState,
      SettingsState settingsState,
      bool isLoading});

  @override
  $WeatherStateCopyWith<$Res> get weatherState;
  @override
  $ThemeStateCopyWith<$Res> get themeState;
  @override
  $SettingsStateCopyWith<$Res> get settingsState;
}

class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object weatherState = freezed,
    Object themeState = freezed,
    Object settingsState = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_AppState(
      weatherState: weatherState == freezed
          ? _value.weatherState
          : weatherState as WeatherState,
      themeState:
          themeState == freezed ? _value.themeState : themeState as ThemeState,
      settingsState: settingsState == freezed
          ? _value.settingsState
          : settingsState as SettingsState,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

class _$_AppState with DiagnosticableTreeMixin implements _AppState {
  const _$_AppState(
      {@required this.weatherState,
      @required this.themeState,
      @required this.settingsState,
      @required this.isLoading})
      : assert(weatherState != null),
        assert(themeState != null),
        assert(settingsState != null),
        assert(isLoading != null);

  @override
  final WeatherState weatherState;
  @override
  final ThemeState themeState;
  @override
  final SettingsState settingsState;
  @override
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(weatherState: $weatherState, themeState: $themeState, settingsState: $settingsState, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('weatherState', weatherState))
      ..add(DiagnosticsProperty('themeState', themeState))
      ..add(DiagnosticsProperty('settingsState', settingsState))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppState &&
            (identical(other.weatherState, weatherState) ||
                const DeepCollectionEquality()
                    .equals(other.weatherState, weatherState)) &&
            (identical(other.themeState, themeState) ||
                const DeepCollectionEquality()
                    .equals(other.themeState, themeState)) &&
            (identical(other.settingsState, settingsState) ||
                const DeepCollectionEquality()
                    .equals(other.settingsState, settingsState)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(weatherState) ^
      const DeepCollectionEquality().hash(themeState) ^
      const DeepCollectionEquality().hash(settingsState) ^
      const DeepCollectionEquality().hash(isLoading);

  @override
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {@required WeatherState weatherState,
      @required ThemeState themeState,
      @required SettingsState settingsState,
      @required bool isLoading}) = _$_AppState;

  @override
  WeatherState get weatherState;
  @override
  ThemeState get themeState;
  @override
  SettingsState get settingsState;
  @override
  bool get isLoading;
  @override
  _$AppStateCopyWith<_AppState> get copyWith;
}
