import 'package:cnp/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              Provider.of<WeatherModel>(context, listen: false)
                  .fetchWeather(_textController.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
