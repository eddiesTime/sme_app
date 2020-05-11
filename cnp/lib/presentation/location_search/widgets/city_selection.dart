import 'package:cnp/application/weather/weather_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This widget build the input field which allows the user to search
/// for a location to receive its weather data.
class CitySelection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              Provider.of<WeatherNotifier>(context, listen: false)
                  .fetchWeatherForLocation(location: _textController.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
