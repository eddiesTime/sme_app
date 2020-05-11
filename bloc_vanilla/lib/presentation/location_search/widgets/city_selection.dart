import 'package:bloc_vanilla/application/weather/weather_bloc.dart';
import 'package:bloc_vanilla/injection.dart';
import 'package:flutter/material.dart';

/// This widget build the input field which allows the user to search
/// for a location to receive its weather data.
class CitySelection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Gets a reference to the WeatherBloc instance.
    final WeatherBloc _weatherBloc = getIt<WeatherBloc>();
    return Form(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Chicago',
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Adds an event to the weather event sink.
              _weatherBloc.weatherEventSink.add(
                WeatherEvent.fetchWeatherForLocation(
                    location: _textController.text),
              );
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
