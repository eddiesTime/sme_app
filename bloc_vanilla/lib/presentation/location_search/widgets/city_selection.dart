import 'package:bloc_vanilla/application/weather/weather_bloc.dart';
import 'package:bloc_vanilla/injection.dart';
import 'package:flutter/material.dart';

class CitySelection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
