// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'theme_actions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeActionsTearOff {
  const _$ThemeActionsTearOff();

  SetThemeAction setThemeAction({@required WeatherCondition weatherCondition}) {
    return SetThemeAction(
      weatherCondition: weatherCondition,
    );
  }
}

// ignore: unused_element
const $ThemeActions = _$ThemeActionsTearOff();

mixin _$ThemeActions {
  WeatherCondition get weatherCondition;

  $ThemeActionsCopyWith<ThemeActions> get copyWith;
}

abstract class $ThemeActionsCopyWith<$Res> {
  factory $ThemeActionsCopyWith(
          ThemeActions value, $Res Function(ThemeActions) then) =
      _$ThemeActionsCopyWithImpl<$Res>;
  $Res call({WeatherCondition weatherCondition});
}

class _$ThemeActionsCopyWithImpl<$Res> implements $ThemeActionsCopyWith<$Res> {
  _$ThemeActionsCopyWithImpl(this._value, this._then);

  final ThemeActions _value;
  // ignore: unused_field
  final $Res Function(ThemeActions) _then;

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

abstract class $SetThemeActionCopyWith<$Res>
    implements $ThemeActionsCopyWith<$Res> {
  factory $SetThemeActionCopyWith(
          SetThemeAction value, $Res Function(SetThemeAction) then) =
      _$SetThemeActionCopyWithImpl<$Res>;
  @override
  $Res call({WeatherCondition weatherCondition});
}

class _$SetThemeActionCopyWithImpl<$Res>
    extends _$ThemeActionsCopyWithImpl<$Res>
    implements $SetThemeActionCopyWith<$Res> {
  _$SetThemeActionCopyWithImpl(
      SetThemeAction _value, $Res Function(SetThemeAction) _then)
      : super(_value, (v) => _then(v as SetThemeAction));

  @override
  SetThemeAction get _value => super._value as SetThemeAction;

  @override
  $Res call({
    Object weatherCondition = freezed,
  }) {
    return _then(SetThemeAction(
      weatherCondition: weatherCondition == freezed
          ? _value.weatherCondition
          : weatherCondition as WeatherCondition,
    ));
  }
}

class _$SetThemeAction with DiagnosticableTreeMixin implements SetThemeAction {
  const _$SetThemeAction({@required this.weatherCondition})
      : assert(weatherCondition != null);

  @override
  final WeatherCondition weatherCondition;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeActions.setThemeAction(weatherCondition: $weatherCondition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeActions.setThemeAction'))
      ..add(DiagnosticsProperty('weatherCondition', weatherCondition));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SetThemeAction &&
            (identical(other.weatherCondition, weatherCondition) ||
                const DeepCollectionEquality()
                    .equals(other.weatherCondition, weatherCondition)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(weatherCondition);

  @override
  $SetThemeActionCopyWith<SetThemeAction> get copyWith =>
      _$SetThemeActionCopyWithImpl<SetThemeAction>(this, _$identity);
}

abstract class SetThemeAction implements ThemeActions {
  const factory SetThemeAction({@required WeatherCondition weatherCondition}) =
      _$SetThemeAction;

  @override
  WeatherCondition get weatherCondition;
  @override
  $SetThemeActionCopyWith<SetThemeAction> get copyWith;
}
