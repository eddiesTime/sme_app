import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/weather_bloc/bloc/weather_bloc.dart';
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
                  .add(FetchWeather(city: _textController.text));
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
