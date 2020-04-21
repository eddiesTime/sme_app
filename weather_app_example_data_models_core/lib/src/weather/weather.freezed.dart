// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

class _$WeatherTearOff {
  const _$WeatherTearOff();

  _Weather call(
      {@JsonKey(name: 'weather_state_abbr') String condition,
      @JsonKey(name: 'weather_state_name') String formattedCondition,
      String windDirectionCompass,
      DateTime created,
      DateTime applicableDate,
      double minTemp,
      double temp,
      double maxTemp,
      double windSpeed,
      double windDirection,
      double airPressure,
      int humidity,
      double visibility,
      int predictability}) {
    return _Weather(
      condition: condition,
      formattedCondition: formattedCondition,
      windDirectionCompass: windDirectionCompass,
      created: created,
      applicableDate: applicableDate,
      minTemp: minTemp,
      temp: temp,
      maxTemp: maxTemp,
      windSpeed: windSpeed,
      windDirection: windDirection,
      airPressure: airPressure,
      humidity: humidity,
      visibility: visibility,
      predictability: predictability,
    );
  }
}

// ignore: unused_element
const $Weather = _$WeatherTearOff();

mixin _$Weather {
  @JsonKey(name: 'weather_state_abbr')
  String get condition;
  @JsonKey(name: 'weather_state_name')
  String get formattedCondition;
  String get windDirectionCompass;
  DateTime get created;
  DateTime get applicableDate;
  double get minTemp;
  double get temp;
  double get maxTemp;
  double get windSpeed;
  double get windDirection;
  double get airPressure;
  int get humidity;
  double get visibility;
  int get predictability;

  Map<String, dynamic> toJson();
  $WeatherCopyWith<Weather> get copyWith;
}

abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'weather_state_abbr') String condition,
      @JsonKey(name: 'weather_state_name') String formattedCondition,
      String windDirectionCompass,
      DateTime created,
      DateTime applicableDate,
      double minTemp,
      double temp,
      double maxTemp,
      double windSpeed,
      double windDirection,
      double airPressure,
      int humidity,
      double visibility,
      int predictability});
}

class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  final Weather _value;
  // ignore: unused_field
  final $Res Function(Weather) _then;

  @override
  $Res call({
    Object condition = freezed,
    Object formattedCondition = freezed,
    Object windDirectionCompass = freezed,
    Object created = freezed,
    Object applicableDate = freezed,
    Object minTemp = freezed,
    Object temp = freezed,
    Object maxTemp = freezed,
    Object windSpeed = freezed,
    Object windDirection = freezed,
    Object airPressure = freezed,
    Object humidity = freezed,
    Object visibility = freezed,
    Object predictability = freezed,
  }) {
    return _then(_value.copyWith(
      condition: condition == freezed ? _value.condition : condition as String,
      formattedCondition: formattedCondition == freezed
          ? _value.formattedCondition
          : formattedCondition as String,
      windDirectionCompass: windDirectionCompass == freezed
          ? _value.windDirectionCompass
          : windDirectionCompass as String,
      created: created == freezed ? _value.created : created as DateTime,
      applicableDate: applicableDate == freezed
          ? _value.applicableDate
          : applicableDate as DateTime,
      minTemp: minTemp == freezed ? _value.minTemp : minTemp as double,
      temp: temp == freezed ? _value.temp : temp as double,
      maxTemp: maxTemp == freezed ? _value.maxTemp : maxTemp as double,
      windSpeed: windSpeed == freezed ? _value.windSpeed : windSpeed as double,
      windDirection: windDirection == freezed
          ? _value.windDirection
          : windDirection as double,
      airPressure:
          airPressure == freezed ? _value.airPressure : airPressure as double,
      humidity: humidity == freezed ? _value.humidity : humidity as int,
      visibility:
          visibility == freezed ? _value.visibility : visibility as double,
      predictability: predictability == freezed
          ? _value.predictability
          : predictability as int,
    ));
  }
}

abstract class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) then) =
      __$WeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'weather_state_abbr') String condition,
      @JsonKey(name: 'weather_state_name') String formattedCondition,
      String windDirectionCompass,
      DateTime created,
      DateTime applicableDate,
      double minTemp,
      double temp,
      double maxTemp,
      double windSpeed,
      double windDirection,
      double airPressure,
      int humidity,
      double visibility,
      int predictability});
}

class __$WeatherCopyWithImpl<$Res> extends _$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(_Weather _value, $Res Function(_Weather) _then)
      : super(_value, (v) => _then(v as _Weather));

  @override
  _Weather get _value => super._value as _Weather;

  @override
  $Res call({
    Object condition = freezed,
    Object formattedCondition = freezed,
    Object windDirectionCompass = freezed,
    Object created = freezed,
    Object applicableDate = freezed,
    Object minTemp = freezed,
    Object temp = freezed,
    Object maxTemp = freezed,
    Object windSpeed = freezed,
    Object windDirection = freezed,
    Object airPressure = freezed,
    Object humidity = freezed,
    Object visibility = freezed,
    Object predictability = freezed,
  }) {
    return _then(_Weather(
      condition: condition == freezed ? _value.condition : condition as String,
      formattedCondition: formattedCondition == freezed
          ? _value.formattedCondition
          : formattedCondition as String,
      windDirectionCompass: windDirectionCompass == freezed
          ? _value.windDirectionCompass
          : windDirectionCompass as String,
      created: created == freezed ? _value.created : created as DateTime,
      applicableDate: applicableDate == freezed
          ? _value.applicableDate
          : applicableDate as DateTime,
      minTemp: minTemp == freezed ? _value.minTemp : minTemp as double,
      temp: temp == freezed ? _value.temp : temp as double,
      maxTemp: maxTemp == freezed ? _value.maxTemp : maxTemp as double,
      windSpeed: windSpeed == freezed ? _value.windSpeed : windSpeed as double,
      windDirection: windDirection == freezed
          ? _value.windDirection
          : windDirection as double,
      airPressure:
          airPressure == freezed ? _value.airPressure : airPressure as double,
      humidity: humidity == freezed ? _value.humidity : humidity as int,
      visibility:
          visibility == freezed ? _value.visibility : visibility as double,
      predictability: predictability == freezed
          ? _value.predictability
          : predictability as int,
    ));
  }
}

@JsonSerializable()
class _$_Weather extends _Weather with DiagnosticableTreeMixin {
  const _$_Weather(
      {@JsonKey(name: 'weather_state_abbr') this.condition,
      @JsonKey(name: 'weather_state_name') this.formattedCondition,
      this.windDirectionCompass,
      this.created,
      this.applicableDate,
      this.minTemp,
      this.temp,
      this.maxTemp,
      this.windSpeed,
      this.windDirection,
      this.airPressure,
      this.humidity,
      this.visibility,
      this.predictability})
      : super._();

  factory _$_Weather.fromJson(Map<String, dynamic> json) =>
      _$_$_WeatherFromJson(json);

  @override
  @JsonKey(name: 'weather_state_abbr')
  final String condition;
  @override
  @JsonKey(name: 'weather_state_name')
  final String formattedCondition;
  @override
  final String windDirectionCompass;
  @override
  final DateTime created;
  @override
  final DateTime applicableDate;
  @override
  final double minTemp;
  @override
  final double temp;
  @override
  final double maxTemp;
  @override
  final double windSpeed;
  @override
  final double windDirection;
  @override
  final double airPressure;
  @override
  final int humidity;
  @override
  final double visibility;
  @override
  final int predictability;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Weather(condition: $condition, formattedCondition: $formattedCondition, windDirectionCompass: $windDirectionCompass, created: $created, applicableDate: $applicableDate, minTemp: $minTemp, temp: $temp, maxTemp: $maxTemp, windSpeed: $windSpeed, windDirection: $windDirection, airPressure: $airPressure, humidity: $humidity, visibility: $visibility, predictability: $predictability)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Weather'))
      ..add(DiagnosticsProperty('condition', condition))
      ..add(DiagnosticsProperty('formattedCondition', formattedCondition))
      ..add(DiagnosticsProperty('windDirectionCompass', windDirectionCompass))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('applicableDate', applicableDate))
      ..add(DiagnosticsProperty('minTemp', minTemp))
      ..add(DiagnosticsProperty('temp', temp))
      ..add(DiagnosticsProperty('maxTemp', maxTemp))
      ..add(DiagnosticsProperty('windSpeed', windSpeed))
      ..add(DiagnosticsProperty('windDirection', windDirection))
      ..add(DiagnosticsProperty('airPressure', airPressure))
      ..add(DiagnosticsProperty('humidity', humidity))
      ..add(DiagnosticsProperty('visibility', visibility))
      ..add(DiagnosticsProperty('predictability', predictability));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Weather &&
            (identical(other.condition, condition) ||
                const DeepCollectionEquality()
                    .equals(other.condition, condition)) &&
            (identical(other.formattedCondition, formattedCondition) ||
                const DeepCollectionEquality()
                    .equals(other.formattedCondition, formattedCondition)) &&
            (identical(other.windDirectionCompass, windDirectionCompass) ||
                const DeepCollectionEquality().equals(
                    other.windDirectionCompass, windDirectionCompass)) &&
            (identical(other.created, created) ||
                const DeepCollectionEquality()
                    .equals(other.created, created)) &&
            (identical(other.applicableDate, applicableDate) ||
                const DeepCollectionEquality()
                    .equals(other.applicableDate, applicableDate)) &&
            (identical(other.minTemp, minTemp) ||
                const DeepCollectionEquality()
                    .equals(other.minTemp, minTemp)) &&
            (identical(other.temp, temp) ||
                const DeepCollectionEquality().equals(other.temp, temp)) &&
            (identical(other.maxTemp, maxTemp) ||
                const DeepCollectionEquality()
                    .equals(other.maxTemp, maxTemp)) &&
            (identical(other.windSpeed, windSpeed) ||
                const DeepCollectionEquality()
                    .equals(other.windSpeed, windSpeed)) &&
            (identical(other.windDirection, windDirection) ||
                const DeepCollectionEquality()
                    .equals(other.windDirection, windDirection)) &&
            (identical(other.airPressure, airPressure) ||
                const DeepCollectionEquality()
                    .equals(other.airPressure, airPressure)) &&
            (identical(other.humidity, humidity) ||
                const DeepCollectionEquality()
                    .equals(other.humidity, humidity)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.predictability, predictability) ||
                const DeepCollectionEquality()
                    .equals(other.predictability, predictability)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(condition) ^
      const DeepCollectionEquality().hash(formattedCondition) ^
      const DeepCollectionEquality().hash(windDirectionCompass) ^
      const DeepCollectionEquality().hash(created) ^
      const DeepCollectionEquality().hash(applicableDate) ^
      const DeepCollectionEquality().hash(minTemp) ^
      const DeepCollectionEquality().hash(temp) ^
      const DeepCollectionEquality().hash(maxTemp) ^
      const DeepCollectionEquality().hash(windSpeed) ^
      const DeepCollectionEquality().hash(windDirection) ^
      const DeepCollectionEquality().hash(airPressure) ^
      const DeepCollectionEquality().hash(humidity) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(predictability);

  @override
  _$WeatherCopyWith<_Weather> get copyWith =>
      __$WeatherCopyWithImpl<_Weather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WeatherToJson(this);
  }
}

abstract class _Weather extends Weather {
  const _Weather._() : super._();
  const factory _Weather(
      {@JsonKey(name: 'weather_state_abbr') String condition,
      @JsonKey(name: 'weather_state_name') String formattedCondition,
      String windDirectionCompass,
      DateTime created,
      DateTime applicableDate,
      double minTemp,
      double temp,
      double maxTemp,
      double windSpeed,
      double windDirection,
      double airPressure,
      int humidity,
      double visibility,
      int predictability}) = _$_Weather;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$_Weather.fromJson;

  @override
  @JsonKey(name: 'weather_state_abbr')
  String get condition;
  @override
  @JsonKey(name: 'weather_state_name')
  String get formattedCondition;
  @override
  String get windDirectionCompass;
  @override
  DateTime get created;
  @override
  DateTime get applicableDate;
  @override
  double get minTemp;
  @override
  double get temp;
  @override
  double get maxTemp;
  @override
  double get windSpeed;
  @override
  double get windDirection;
  @override
  double get airPressure;
  @override
  int get humidity;
  @override
  double get visibility;
  @override
  int get predictability;
  @override
  _$WeatherCopyWith<_Weather> get copyWith;
}
