// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SettingsEventTearOff {
  const _$SettingsEventTearOff();

  ToggleTemperatureUnit toggleTemperatureUnit(bool value) {
    return ToggleTemperatureUnit(
      value,
    );
  }
}

// ignore: unused_element
const $SettingsEvent = _$SettingsEventTearOff();

mixin _$SettingsEvent {
  bool get value;

  $SettingsEventCopyWith<SettingsEvent> get copyWith;
}

abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
  $Res call({bool value});
}

class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed ? _value.value : value as bool,
    ));
  }
}

abstract class $ToggleTemperatureUnitCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory $ToggleTemperatureUnitCopyWith(ToggleTemperatureUnit value,
          $Res Function(ToggleTemperatureUnit) then) =
      _$ToggleTemperatureUnitCopyWithImpl<$Res>;
  @override
  $Res call({bool value});
}

class _$ToggleTemperatureUnitCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements $ToggleTemperatureUnitCopyWith<$Res> {
  _$ToggleTemperatureUnitCopyWithImpl(
      ToggleTemperatureUnit _value, $Res Function(ToggleTemperatureUnit) _then)
      : super(_value, (v) => _then(v as ToggleTemperatureUnit));

  @override
  ToggleTemperatureUnit get _value => super._value as ToggleTemperatureUnit;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(ToggleTemperatureUnit(
      value == freezed ? _value.value : value as bool,
    ));
  }
}

class _$ToggleTemperatureUnit implements ToggleTemperatureUnit {
  const _$ToggleTemperatureUnit(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'SettingsEvent.toggleTemperatureUnit(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ToggleTemperatureUnit &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  $ToggleTemperatureUnitCopyWith<ToggleTemperatureUnit> get copyWith =>
      _$ToggleTemperatureUnitCopyWithImpl<ToggleTemperatureUnit>(
          this, _$identity);
}

abstract class ToggleTemperatureUnit implements SettingsEvent {
  const factory ToggleTemperatureUnit(bool value) = _$ToggleTemperatureUnit;

  @override
  bool get value;
  @override
  $ToggleTemperatureUnitCopyWith<ToggleTemperatureUnit> get copyWith;
}

class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

  _SettingsState call({@required TemperatureUnit temperatureUnit}) {
    return _SettingsState(
      temperatureUnit: temperatureUnit,
    );
  }
}

// ignore: unused_element
const $SettingsState = _$SettingsStateTearOff();

mixin _$SettingsState {
  TemperatureUnit get temperatureUnit;

  $SettingsStateCopyWith<SettingsState> get copyWith;
}

abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call({TemperatureUnit temperatureUnit});
}

class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object temperatureUnit = freezed,
  }) {
    return _then(_value.copyWith(
      temperatureUnit: temperatureUnit == freezed
          ? _value.temperatureUnit
          : temperatureUnit as TemperatureUnit,
    ));
  }
}

abstract class _$SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(
          _SettingsState value, $Res Function(_SettingsState) then) =
      __$SettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({TemperatureUnit temperatureUnit});
}

class __$SettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(
      _SettingsState _value, $Res Function(_SettingsState) _then)
      : super(_value, (v) => _then(v as _SettingsState));

  @override
  _SettingsState get _value => super._value as _SettingsState;

  @override
  $Res call({
    Object temperatureUnit = freezed,
  }) {
    return _then(_SettingsState(
      temperatureUnit: temperatureUnit == freezed
          ? _value.temperatureUnit
          : temperatureUnit as TemperatureUnit,
    ));
  }
}

class _$_SettingsState implements _SettingsState {
  const _$_SettingsState({@required this.temperatureUnit})
      : assert(temperatureUnit != null);

  @override
  final TemperatureUnit temperatureUnit;

  @override
  String toString() {
    return 'SettingsState(temperatureUnit: $temperatureUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsState &&
            (identical(other.temperatureUnit, temperatureUnit) ||
                const DeepCollectionEquality()
                    .equals(other.temperatureUnit, temperatureUnit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(temperatureUnit);

  @override
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState({@required TemperatureUnit temperatureUnit}) =
      _$_SettingsState;

  @override
  TemperatureUnit get temperatureUnit;
  @override
  _$SettingsStateCopyWith<_SettingsState> get copyWith;
}
