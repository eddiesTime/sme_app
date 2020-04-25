// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeEventTearOff {
  const _$ThemeEventTearOff();

  WeatherChanged weatherChanged(WeatherCondition weatherCondition) {
    return WeatherChanged(
      weatherCondition,
    );
  }
}

// ignore: unused_element
const $ThemeEvent = _$ThemeEventTearOff();

mixin _$ThemeEvent {
  WeatherCondition get weatherCondition;

  $ThemeEventCopyWith<ThemeEvent> get copyWith;
}

abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res>;
  $Res call({WeatherCondition weatherCondition});
}

class _$ThemeEventCopyWithImpl<$Res> implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  final ThemeEvent _value;
  // ignore: unused_field
  final $Res Function(ThemeEvent) _then;

  @override
  $Res call({
    Object weatherCondition = freezed,
  }) {
    return _then(_value.copyWith(
      weatherCondition: weatherCondition == freezed
          ? _value.weatherCondition
          : weatherCondition as WeatherCondition,
    ));
  }
}

abstract class $WeatherChangedCopyWith<$Res>
    implements $ThemeEventCopyWith<$Res> {
  factory $WeatherChangedCopyWith(
          WeatherChanged value, $Res Function(WeatherChanged) then) =
      _$WeatherChangedCopyWithImpl<$Res>;
  @override
  $Res call({WeatherCondition weatherCondition});
}

class _$WeatherChangedCopyWithImpl<$Res> extends _$ThemeEventCopyWithImpl<$Res>
    implements $WeatherChangedCopyWith<$Res> {
  _$WeatherChangedCopyWithImpl(
      WeatherChanged _value, $Res Function(WeatherChanged) _then)
      : super(_value, (v) => _then(v as WeatherChanged));

  @override
  WeatherChanged get _value => super._value as WeatherChanged;

  @override
  $Res call({
    Object weatherCondition = freezed,
  }) {
    return _then(WeatherChanged(
      weatherCondition == freezed
          ? _value.weatherCondition
          : weatherCondition as WeatherCondition,
    ));
  }
}

class _$WeatherChanged with DiagnosticableTreeMixin implements WeatherChanged {
  const _$WeatherChanged(this.weatherCondition)
      : assert(weatherCondition != null);

  @override
  final WeatherCondition weatherCondition;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeEvent.weatherChanged(weatherCondition: $weatherCondition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeEvent.weatherChanged'))
      ..add(DiagnosticsProperty('weatherCondition', weatherCondition));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WeatherChanged &&
            (identical(other.weatherCondition, weatherCondition) ||
                const DeepCollectionEquality()
                    .equals(other.weatherCondition, weatherCondition)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(weatherCondition);

  @override
  $WeatherChangedCopyWith<WeatherChanged> get copyWith =>
      _$WeatherChangedCopyWithImpl<WeatherChanged>(this, _$identity);
}

abstract class WeatherChanged implements ThemeEvent {
  const factory WeatherChanged(WeatherCondition weatherCondition) =
      _$WeatherChanged;

  @override
  WeatherCondition get weatherCondition;
  @override
  $WeatherChangedCopyWith<WeatherChanged> get copyWith;
}
