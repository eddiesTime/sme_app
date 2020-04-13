import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_example/stores/weather_store.dart';

class CitySelection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Chicago',
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _fetchWeather(context, _textController.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void _fetchWeather(BuildContext context, String city) {
    final _reactiveModel = Injector.getAsReactive<WeatherStore>();
    _reactiveModel.setState((store) => store.getWeather(city));
  }
}
