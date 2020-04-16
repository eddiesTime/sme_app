// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:mobx_example/model/enums/enum_temperature_units.dart';
// import 'package:mobx_example/stores/temperature_store.dart';
// import 'package:provider/provider.dart';

// class Temperature extends StatelessWidget {
//   double temperature;
//   double low;
//   double high;

//   Temperature(this.temperature, this.low, this.high);

//   @override
//   Widget build(BuildContext context) {
//     final TemperatureStore _temperatureStore =
//         Provider.of<TemperatureStore>(context);
//     return Observer(builder: (_) {
//       return Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(right: 20.0),
//             child: Text(
//               _temperatureStore.tempUnit == TemperatureUnit.celsius
//                   ? '${_formattedTemperature(_temperatureStore.tempUnit, temperature)}°C'
//                   : '${_formattedTemperature(_temperatureStore.tempUnit, temperature)}°F',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Column(
//             children: [
//               Text(
//                 _temperatureStore.tempUnit == TemperatureUnit.celsius
//                     ? 'min ${_formattedTemperature(_temperatureStore.tempUnit, low)}°C'
//                     : 'min ${_formattedTemperature(_temperatureStore.tempUnit, low)}°F',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w100,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 _temperatureStore.tempUnit == TemperatureUnit.celsius
//                     ? 'max ${_formattedTemperature(_temperatureStore.tempUnit, high)}°C'
//                     : 'max ${_formattedTemperature(_temperatureStore.tempUnit, high)}°F',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w100,
//                   color: Colors.white,
//                 ),
//               )
//             ],
//           )
//         ],
//       );
//     });
//   }

//   int _formattedTemperature(TemperatureUnit temperatureUnit, double t) {
//     if (temperatureUnit == TemperatureUnit.fahrenheit) {
//       final int fTemp = ((t * 9 / 5) + 32).round();
//       return fTemp;
//     }
//     return t.round();
//   }
// }
