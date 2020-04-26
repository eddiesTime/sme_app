// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather_actions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WeatherActionsTearOff {
  const _$WeatherActionsTearOff();

  FetchWeatherAction fetchWeatherAction({@required String location}) {
    return FetchWeatherAction(
      location: location,
    );
  }

  WeatherLoadedAction weatherLoadedAction(
      {@required WeatherResponse weatherResponse}) {
    return WeatherLoadedAction(
      weatherResponse: weatherResponse,
    );
  }

  WeatherNotLoadedAction weatherNotLoadedAction() {
    return const WeatherNotLoadedAction();
  }

  SetIsRefreshingAction setIsRefreshingAction() {
    return const SetIsRefreshingAction();
  }

  RefreshWeatherAction refreshWeatherAction() {
    return const RefreshWeatherAction();
  }
}

// ignore: unused_element
const $WeatherActions = _$WeatherActionsTearOff();

mixin _$WeatherActions {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchWeatherAction(String location),
    @required Result weatherLoadedAction(WeatherResponse weatherResponse),
    @required Result weatherNotLoadedAction(),
    @required Result setIsRefreshingAction(),
    @required Result refreshWeatherAction(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchWeatherAction(String location),
    Result weatherLoadedAction(WeatherResponse weatherResponse),
    Result weatherNotLoadedAction(),
    Result setIsRefreshingAction(),
    Result refreshWeatherAction(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchWeatherAction(FetchWeatherAction value),
    @required Result weatherLoadedAction(WeatherLoadedAction value),
    @required Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    @required Result setIsRefreshingAction(SetIsRefreshingAction value),
    @required Result refreshWeatherAction(RefreshWeatherAction value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchWeatherAction(FetchWeatherAction value),
    Result weatherLoadedAction(WeatherLoadedAction value),
    Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    Result setIsRefreshingAction(SetIsRefreshingAction value),
    Result refreshWeatherAction(RefreshWeatherAction value),
    @required Result orElse(),
  });
}

abstract class $WeatherActionsCopyWith<$Res> {
  factory $WeatherActionsCopyWith(
          WeatherActions value, $Res Function(WeatherActions) then) =
      _$WeatherActionsCopyWithImpl<$Res>;
}

class _$WeatherActionsCopyWithImpl<$Res>
    implements $WeatherActionsCopyWith<$Res> {
  _$WeatherActionsCopyWithImpl(this._value, this._then);

  final WeatherActions _value;
  // ignore: unused_field
  final $Res Function(WeatherActions) _then;
}

abstract class $FetchWeatherActionCopyWith<$Res> {
  factory $FetchWeatherActionCopyWith(
          FetchWeatherAction value, $Res Function(FetchWeatherAction) then) =
      _$FetchWeatherActionCopyWithImpl<$Res>;
  $Res call({String location});
}

class _$FetchWeatherActionCopyWithImpl<$Res>
    extends _$WeatherActionsCopyWithImpl<$Res>
    implements $FetchWeatherActionCopyWith<$Res> {
  _$FetchWeatherActionCopyWithImpl(
      FetchWeatherAction _value, $Res Function(FetchWeatherAction) _then)
      : super(_value, (v) => _then(v as FetchWeatherAction));

  @override
  FetchWeatherAction get _value => super._value as FetchWeatherAction;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(FetchWeatherAction(
      location: location == freezed ? _value.location : location as String,
    ));
  }
}

class _$FetchWeatherAction
    with DiagnosticableTreeMixin
    implements FetchWeatherAction {
  const _$FetchWeatherAction({@required this.location})
      : assert(location != null);

  @override
  final String location;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherActions.fetchWeatherAction(location: $location)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherActions.fetchWeatherAction'))
      ..add(DiagnosticsProperty('location', location));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchWeatherAction &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @override
  $FetchWeatherActionCopyWith<FetchWeatherAction> get copyWith =>
      _$FetchWeatherActionCopyWithImpl<FetchWeatherAction>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchWeatherAction(String location),
    @required Result weatherLoadedAction(WeatherResponse weatherResponse),
    @required Result weatherNotLoadedAction(),
    @required Result setIsRefreshingAction(),
    @required Result refreshWeatherAction(),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return fetchWeatherAction(location);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchWeatherAction(String location),
    Result weatherLoadedAction(WeatherResponse weatherResponse),
    Result weatherNotLoadedAction(),
    Result setIsRefreshingAction(),
    Result refreshWeatherAction(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherAction != null) {
      return fetchWeatherAction(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchWeatherAction(FetchWeatherAction value),
    @required Result weatherLoadedAction(WeatherLoadedAction value),
    @required Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    @required Result setIsRefreshingAction(SetIsRefreshingAction value),
    @required Result refreshWeatherAction(RefreshWeatherAction value),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return fetchWeatherAction(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchWeatherAction(FetchWeatherAction value),
    Result weatherLoadedAction(WeatherLoadedAction value),
    Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    Result setIsRefreshingAction(SetIsRefreshingAction value),
    Result refreshWeatherAction(RefreshWeatherAction value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchWeatherAction != null) {
      return fetchWeatherAction(this);
    }
    return orElse();
  }
}

abstract class FetchWeatherAction implements WeatherActions {
  const factory FetchWeatherAction({@required String location}) =
      _$FetchWeatherAction;

  String get location;
  $FetchWeatherActionCopyWith<FetchWeatherAction> get copyWith;
}

abstract class $WeatherLoadedActionCopyWith<$Res> {
  factory $WeatherLoadedActionCopyWith(
          WeatherLoadedAction value, $Res Function(WeatherLoadedAction) then) =
      _$WeatherLoadedActionCopyWithImpl<$Res>;
  $Res call({WeatherResponse weatherResponse});

  $WeatherResponseCopyWith<$Res> get weatherResponse;
}

class _$WeatherLoadedActionCopyWithImpl<$Res>
    extends _$WeatherActionsCopyWithImpl<$Res>
    implements $WeatherLoadedActionCopyWith<$Res> {
  _$WeatherLoadedActionCopyWithImpl(
      WeatherLoadedAction _value, $Res Function(WeatherLoadedAction) _then)
      : super(_value, (v) => _then(v as WeatherLoadedAction));

  @override
  WeatherLoadedAction get _value => super._value as WeatherLoadedAction;

  @override
  $Res call({
    Object weatherResponse = freezed,
  }) {
    return _then(WeatherLoadedAction(
      weatherResponse: weatherResponse == freezed
          ? _value.weatherResponse
          : weatherResponse as WeatherResponse,
    ));
  }

  @override
  $WeatherResponseCopyWith<$Res> get weatherResponse {
    if (_value.weatherResponse == null) {
      return null;
    }
    return $WeatherResponseCopyWith<$Res>(_value.weatherResponse, (value) {
      return _then(_value.copyWith(weatherResponse: value));
    });
  }
}

class _$WeatherLoadedAction
    with DiagnosticableTreeMixin
    implements WeatherLoadedAction {
  const _$WeatherLoadedAction({@required this.weatherResponse})
      : assert(weatherResponse != null);

  @override
  final WeatherResponse weatherResponse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherActions.weatherLoadedAction(weatherResponse: $weatherResponse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherActions.weatherLoadedAction'))
      ..add(DiagnosticsProperty('weatherResponse', weatherResponse));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WeatherLoadedAction &&
            (identical(other.weatherResponse, weatherResponse) ||
                const DeepCollectionEquality()
                    .equals(other.weatherResponse, weatherResponse)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(weatherResponse);

  @override
  $WeatherLoadedActionCopyWith<WeatherLoadedAction> get copyWith =>
      _$WeatherLoadedActionCopyWithImpl<WeatherLoadedAction>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchWeatherAction(String location),
    @required Result weatherLoadedAction(WeatherResponse weatherResponse),
    @required Result weatherNotLoadedAction(),
    @required Result setIsRefreshingAction(),
    @required Result refreshWeatherAction(),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return weatherLoadedAction(weatherResponse);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchWeatherAction(String location),
    Result weatherLoadedAction(WeatherResponse weatherResponse),
    Result weatherNotLoadedAction(),
    Result setIsRefreshingAction(),
    Result refreshWeatherAction(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (weatherLoadedAction != null) {
      return weatherLoadedAction(weatherResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchWeatherAction(FetchWeatherAction value),
    @required Result weatherLoadedAction(WeatherLoadedAction value),
    @required Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    @required Result setIsRefreshingAction(SetIsRefreshingAction value),
    @required Result refreshWeatherAction(RefreshWeatherAction value),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return weatherLoadedAction(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchWeatherAction(FetchWeatherAction value),
    Result weatherLoadedAction(WeatherLoadedAction value),
    Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    Result setIsRefreshingAction(SetIsRefreshingAction value),
    Result refreshWeatherAction(RefreshWeatherAction value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (weatherLoadedAction != null) {
      return weatherLoadedAction(this);
    }
    return orElse();
  }
}

abstract class WeatherLoadedAction implements WeatherActions {
  const factory WeatherLoadedAction(
      {@required WeatherResponse weatherResponse}) = _$WeatherLoadedAction;

  WeatherResponse get weatherResponse;
  $WeatherLoadedActionCopyWith<WeatherLoadedAction> get copyWith;
}

abstract class $WeatherNotLoadedActionCopyWith<$Res> {
  factory $WeatherNotLoadedActionCopyWith(WeatherNotLoadedAction value,
          $Res Function(WeatherNotLoadedAction) then) =
      _$WeatherNotLoadedActionCopyWithImpl<$Res>;
}

class _$WeatherNotLoadedActionCopyWithImpl<$Res>
    extends _$WeatherActionsCopyWithImpl<$Res>
    implements $WeatherNotLoadedActionCopyWith<$Res> {
  _$WeatherNotLoadedActionCopyWithImpl(WeatherNotLoadedAction _value,
      $Res Function(WeatherNotLoadedAction) _then)
      : super(_value, (v) => _then(v as WeatherNotLoadedAction));

  @override
  WeatherNotLoadedAction get _value => super._value as WeatherNotLoadedAction;
}

class _$WeatherNotLoadedAction
    with DiagnosticableTreeMixin
    implements WeatherNotLoadedAction {
  const _$WeatherNotLoadedAction();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherActions.weatherNotLoadedAction()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'WeatherActions.weatherNotLoadedAction'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is WeatherNotLoadedAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchWeatherAction(String location),
    @required Result weatherLoadedAction(WeatherResponse weatherResponse),
    @required Result weatherNotLoadedAction(),
    @required Result setIsRefreshingAction(),
    @required Result refreshWeatherAction(),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return weatherNotLoadedAction();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchWeatherAction(String location),
    Result weatherLoadedAction(WeatherResponse weatherResponse),
    Result weatherNotLoadedAction(),
    Result setIsRefreshingAction(),
    Result refreshWeatherAction(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (weatherNotLoadedAction != null) {
      return weatherNotLoadedAction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchWeatherAction(FetchWeatherAction value),
    @required Result weatherLoadedAction(WeatherLoadedAction value),
    @required Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    @required Result setIsRefreshingAction(SetIsRefreshingAction value),
    @required Result refreshWeatherAction(RefreshWeatherAction value),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return weatherNotLoadedAction(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchWeatherAction(FetchWeatherAction value),
    Result weatherLoadedAction(WeatherLoadedAction value),
    Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    Result setIsRefreshingAction(SetIsRefreshingAction value),
    Result refreshWeatherAction(RefreshWeatherAction value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (weatherNotLoadedAction != null) {
      return weatherNotLoadedAction(this);
    }
    return orElse();
  }
}

abstract class WeatherNotLoadedAction implements WeatherActions {
  const factory WeatherNotLoadedAction() = _$WeatherNotLoadedAction;
}

abstract class $SetIsRefreshingActionCopyWith<$Res> {
  factory $SetIsRefreshingActionCopyWith(SetIsRefreshingAction value,
          $Res Function(SetIsRefreshingAction) then) =
      _$SetIsRefreshingActionCopyWithImpl<$Res>;
}

class _$SetIsRefreshingActionCopyWithImpl<$Res>
    extends _$WeatherActionsCopyWithImpl<$Res>
    implements $SetIsRefreshingActionCopyWith<$Res> {
  _$SetIsRefreshingActionCopyWithImpl(
      SetIsRefreshingAction _value, $Res Function(SetIsRefreshingAction) _then)
      : super(_value, (v) => _then(v as SetIsRefreshingAction));

  @override
  SetIsRefreshingAction get _value => super._value as SetIsRefreshingAction;
}

class _$SetIsRefreshingAction
    with DiagnosticableTreeMixin
    implements SetIsRefreshingAction {
  const _$SetIsRefreshingAction();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherActions.setIsRefreshingAction()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'WeatherActions.setIsRefreshingAction'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SetIsRefreshingAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchWeatherAction(String location),
    @required Result weatherLoadedAction(WeatherResponse weatherResponse),
    @required Result weatherNotLoadedAction(),
    @required Result setIsRefreshingAction(),
    @required Result refreshWeatherAction(),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return setIsRefreshingAction();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchWeatherAction(String location),
    Result weatherLoadedAction(WeatherResponse weatherResponse),
    Result weatherNotLoadedAction(),
    Result setIsRefreshingAction(),
    Result refreshWeatherAction(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setIsRefreshingAction != null) {
      return setIsRefreshingAction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchWeatherAction(FetchWeatherAction value),
    @required Result weatherLoadedAction(WeatherLoadedAction value),
    @required Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    @required Result setIsRefreshingAction(SetIsRefreshingAction value),
    @required Result refreshWeatherAction(RefreshWeatherAction value),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return setIsRefreshingAction(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchWeatherAction(FetchWeatherAction value),
    Result weatherLoadedAction(WeatherLoadedAction value),
    Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    Result setIsRefreshingAction(SetIsRefreshingAction value),
    Result refreshWeatherAction(RefreshWeatherAction value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (setIsRefreshingAction != null) {
      return setIsRefreshingAction(this);
    }
    return orElse();
  }
}

abstract class SetIsRefreshingAction implements WeatherActions {
  const factory SetIsRefreshingAction() = _$SetIsRefreshingAction;
}

abstract class $RefreshWeatherActionCopyWith<$Res> {
  factory $RefreshWeatherActionCopyWith(RefreshWeatherAction value,
          $Res Function(RefreshWeatherAction) then) =
      _$RefreshWeatherActionCopyWithImpl<$Res>;
}

class _$RefreshWeatherActionCopyWithImpl<$Res>
    extends _$WeatherActionsCopyWithImpl<$Res>
    implements $RefreshWeatherActionCopyWith<$Res> {
  _$RefreshWeatherActionCopyWithImpl(
      RefreshWeatherAction _value, $Res Function(RefreshWeatherAction) _then)
      : super(_value, (v) => _then(v as RefreshWeatherAction));

  @override
  RefreshWeatherAction get _value => super._value as RefreshWeatherAction;
}

class _$RefreshWeatherAction
    with DiagnosticableTreeMixin
    implements RefreshWeatherAction {
  const _$RefreshWeatherAction();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherActions.refreshWeatherAction()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherActions.refreshWeatherAction'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RefreshWeatherAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result fetchWeatherAction(String location),
    @required Result weatherLoadedAction(WeatherResponse weatherResponse),
    @required Result weatherNotLoadedAction(),
    @required Result setIsRefreshingAction(),
    @required Result refreshWeatherAction(),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return refreshWeatherAction();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result fetchWeatherAction(String location),
    Result weatherLoadedAction(WeatherResponse weatherResponse),
    Result weatherNotLoadedAction(),
    Result setIsRefreshingAction(),
    Result refreshWeatherAction(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshWeatherAction != null) {
      return refreshWeatherAction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result fetchWeatherAction(FetchWeatherAction value),
    @required Result weatherLoadedAction(WeatherLoadedAction value),
    @required Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    @required Result setIsRefreshingAction(SetIsRefreshingAction value),
    @required Result refreshWeatherAction(RefreshWeatherAction value),
  }) {
    assert(fetchWeatherAction != null);
    assert(weatherLoadedAction != null);
    assert(weatherNotLoadedAction != null);
    assert(setIsRefreshingAction != null);
    assert(refreshWeatherAction != null);
    return refreshWeatherAction(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result fetchWeatherAction(FetchWeatherAction value),
    Result weatherLoadedAction(WeatherLoadedAction value),
    Result weatherNotLoadedAction(WeatherNotLoadedAction value),
    Result setIsRefreshingAction(SetIsRefreshingAction value),
    Result refreshWeatherAction(RefreshWeatherAction value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refreshWeatherAction != null) {
      return refreshWeatherAction(this);
    }
    return orElse();
  }
}

abstract class RefreshWeatherAction implements WeatherActions {
  const factory RefreshWeatherAction() = _$RefreshWeatherAction;
}
