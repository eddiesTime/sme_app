// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SettingsEntityTearOff {
  const _$SettingsEntityTearOff();

  _SettingsEntity call({@required TemperatureUnit temperatureUnit}) {
    return _SettingsEntity(
      temperatureUnit: temperatureUnit,
    );
  }
}

// ignore: unused_element
const $SettingsEntity = _$SettingsEntityTearOff();

mixin _$SettingsEntity {
  TemperatureUnit get temperatureUnit;

  $SettingsEntityCopyWith<SettingsEntity> get copyWith;
}

abstract class $SettingsEntityCopyWith<$Res> {
  factory $SettingsEntityCopyWith(
          SettingsEntity value, $Res Function(SettingsEntity) then) =
      _$SettingsEntityCopyWithImpl<$Res>;
  $Res call({TemperatureUnit temperatureUnit});
}

class _$SettingsEntityCopyWithImpl<$Res>
    implements $SettingsEntityCopyWith<$Res> {
  _$SettingsEntityCopyWithImpl(this._value, this._then);

  final SettingsEntity _value;
  // ignore: unused_field
  final $Res Function(SettingsEntity) _then;

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

abstract class _$SettingsEntityCopyWith<$Res>
    implements $SettingsEntityCopyWith<$Res> {
  factory _$SettingsEntityCopyWith(
          _SettingsEntity value, $Res Function(_SettingsEntity) then) =
      __$SettingsEntityCopyWithImpl<$Res>;
  @override
  $Res call({TemperatureUnit temperatureUnit});
}

class __$SettingsEntityCopyWithImpl<$Res>
    extends _$SettingsEntityCopyWithImpl<$Res>
    implements _$SettingsEntityCopyWith<$Res> {
  __$SettingsEntityCopyWithImpl(
      _SettingsEntity _value, $Res Function(_SettingsEntity) _then)
      : super(_value, (v) => _then(v as _SettingsEntity));

  @override
  _SettingsEntity get _value => super._value as _SettingsEntity;

  @override
  $Res call({
    Object temperatureUnit = freezed,
  }) {
    return _then(_SettingsEntity(
      temperatureUnit: temperatureUnit == freezed
          ? _value.temperatureUnit
          : temperatureUnit as TemperatureUnit,
    ));
  }
}

class _$_SettingsEntity
    with DiagnosticableTreeMixin
    implements _SettingsEntity {
  const _$_SettingsEntity({@required this.temperatureUnit})
      : assert(temperatureUnit != null);

  @override
  final TemperatureUnit temperatureUnit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsEntity(temperatureUnit: $temperatureUnit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsEntity'))
      ..add(DiagnosticsProperty('temperatureUnit', temperatureUnit));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsEntity &&
            (identical(other.temperatureUnit, temperatureUnit) ||
                const DeepCollectionEquality()
                    .equals(other.temperatureUnit, temperatureUnit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(temperatureUnit);

  @override
  _$SettingsEntityCopyWith<_SettingsEntity> get copyWith =>
      __$SettingsEntityCopyWithImpl<_SettingsEntity>(this, _$identity);
}

abstract class _SettingsEntity implements SettingsEntity {
  const factory _SettingsEntity({@required TemperatureUnit temperatureUnit}) =
      _$_SettingsEntity;

  @override
  TemperatureUnit get temperatureUnit;
  @override
  _$SettingsEntityCopyWith<_SettingsEntity> get copyWith;
}
