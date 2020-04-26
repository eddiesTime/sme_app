// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

  _SettingsState call({@required SettingsEntity settingsEntity}) {
    return _SettingsState(
      settingsEntity: settingsEntity,
    );
  }
}

// ignore: unused_element
const $SettingsState = _$SettingsStateTearOff();

mixin _$SettingsState {
  SettingsEntity get settingsEntity;

  $SettingsStateCopyWith<SettingsState> get copyWith;
}

abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call({SettingsEntity settingsEntity});

  $SettingsEntityCopyWith<$Res> get settingsEntity;
}

class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object settingsEntity = freezed,
  }) {
    return _then(_value.copyWith(
      settingsEntity: settingsEntity == freezed
          ? _value.settingsEntity
          : settingsEntity as SettingsEntity,
    ));
  }

  @override
  $SettingsEntityCopyWith<$Res> get settingsEntity {
    if (_value.settingsEntity == null) {
      return null;
    }
    return $SettingsEntityCopyWith<$Res>(_value.settingsEntity, (value) {
      return _then(_value.copyWith(settingsEntity: value));
    });
  }
}

abstract class _$SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(
          _SettingsState value, $Res Function(_SettingsState) then) =
      __$SettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({SettingsEntity settingsEntity});

  @override
  $SettingsEntityCopyWith<$Res> get settingsEntity;
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
    Object settingsEntity = freezed,
  }) {
    return _then(_SettingsState(
      settingsEntity: settingsEntity == freezed
          ? _value.settingsEntity
          : settingsEntity as SettingsEntity,
    ));
  }
}

@factoryMethod
class _$_SettingsState implements _SettingsState {
  const _$_SettingsState({@required this.settingsEntity})
      : assert(settingsEntity != null);

  @override
  final SettingsEntity settingsEntity;

  @override
  String toString() {
    return 'SettingsState(settingsEntity: $settingsEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsState &&
            (identical(other.settingsEntity, settingsEntity) ||
                const DeepCollectionEquality()
                    .equals(other.settingsEntity, settingsEntity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(settingsEntity);

  @override
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState({@required SettingsEntity settingsEntity}) =
      _$_SettingsState;

  @override
  SettingsEntity get settingsEntity;
  @override
  _$SettingsStateCopyWith<_SettingsState> get copyWith;
}
