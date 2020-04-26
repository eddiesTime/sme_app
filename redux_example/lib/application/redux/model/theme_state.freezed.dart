// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  _ThemeState call({@required ThemeEntity themeEntity}) {
    return _ThemeState(
      themeEntity: themeEntity,
    );
  }
}

// ignore: unused_element
const $ThemeState = _$ThemeStateTearOff();

mixin _$ThemeState {
  ThemeEntity get themeEntity;

  $ThemeStateCopyWith<ThemeState> get copyWith;
}

abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call({ThemeEntity themeEntity});

  $ThemeEntityCopyWith<$Res> get themeEntity;
}

class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object themeEntity = freezed,
  }) {
    return _then(_value.copyWith(
      themeEntity: themeEntity == freezed
          ? _value.themeEntity
          : themeEntity as ThemeEntity,
    ));
  }

  @override
  $ThemeEntityCopyWith<$Res> get themeEntity {
    if (_value.themeEntity == null) {
      return null;
    }
    return $ThemeEntityCopyWith<$Res>(_value.themeEntity, (value) {
      return _then(_value.copyWith(themeEntity: value));
    });
  }
}

abstract class _$ThemeStateCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateCopyWith(
          _ThemeState value, $Res Function(_ThemeState) then) =
      __$ThemeStateCopyWithImpl<$Res>;
  @override
  $Res call({ThemeEntity themeEntity});

  @override
  $ThemeEntityCopyWith<$Res> get themeEntity;
}

class __$ThemeStateCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$ThemeStateCopyWith<$Res> {
  __$ThemeStateCopyWithImpl(
      _ThemeState _value, $Res Function(_ThemeState) _then)
      : super(_value, (v) => _then(v as _ThemeState));

  @override
  _ThemeState get _value => super._value as _ThemeState;

  @override
  $Res call({
    Object themeEntity = freezed,
  }) {
    return _then(_ThemeState(
      themeEntity: themeEntity == freezed
          ? _value.themeEntity
          : themeEntity as ThemeEntity,
    ));
  }
}

@factoryMethod
class _$_ThemeState with DiagnosticableTreeMixin implements _ThemeState {
  const _$_ThemeState({@required this.themeEntity})
      : assert(themeEntity != null);

  @override
  final ThemeEntity themeEntity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeState(themeEntity: $themeEntity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThemeState'))
      ..add(DiagnosticsProperty('themeEntity', themeEntity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeState &&
            (identical(other.themeEntity, themeEntity) ||
                const DeepCollectionEquality()
                    .equals(other.themeEntity, themeEntity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(themeEntity);

  @override
  _$ThemeStateCopyWith<_ThemeState> get copyWith =>
      __$ThemeStateCopyWithImpl<_ThemeState>(this, _$identity);
}

abstract class _ThemeState implements ThemeState {
  const factory _ThemeState({@required ThemeEntity themeEntity}) =
      _$_ThemeState;

  @override
  ThemeEntity get themeEntity;
  @override
  _$ThemeStateCopyWith<_ThemeState> get copyWith;
}
