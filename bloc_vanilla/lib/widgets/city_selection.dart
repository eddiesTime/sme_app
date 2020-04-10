import 'package:bloc_vanilla/blocs/bloc_provider.dart';
import 'package:bloc_vanilla/blocs/weather_bloc/weather_bloc.dart';
import 'package:bloc_vanilla/blocs/weather_bloc/weather_event.dart';
import 'package:bloc_vanilla/weather_model.dart';
import 'package:flutter/material.dart';

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
              BlocProvider.of<WeatherBloc>(context)
                  .WeatherEventSink
                  .add(FetchWeather(city: _textController.text));
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
