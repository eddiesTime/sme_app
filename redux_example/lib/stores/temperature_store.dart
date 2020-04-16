import 'package:mobx/mobx.dart';
import 'package:mobx_example/model/enums/enum_temperature_units.dart';
import 'package:mobx_example/model/enums/enum_temperature_units.dart';

part 'temperature_store.g.dart';

class TemperatureStore = _TemperatureStore with _$TemperatureStore;

abstract class _TemperatureStore with Store {
  @observable
  TemperatureUnit tempUnit = TemperatureUnit.celsius;

  @computed
  bool get value {
    if (tempUnit != null) {
      return tempUnit == TemperatureUnit.celsius;
    }
  }

  @action
  void toggleTemperatureUnit() {
    tempUnit == TemperatureUnit.celsius
        ? tempUnit = TemperatureUnit.fahrenheit
        : tempUnit = TemperatureUnit.celsius;
  }
}
