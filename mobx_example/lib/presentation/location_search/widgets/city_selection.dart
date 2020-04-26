import 'package:flutter/material.dart';
import 'package:mobx_example/application/weather/weather_store.dart';
import 'package:provider/provider.dart';

class CitySelection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WeatherStore _weatherStore = Provider.of<WeatherStore>(context);
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
              _weatherStore.getWeather(_textController.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
