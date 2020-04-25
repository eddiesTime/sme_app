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
