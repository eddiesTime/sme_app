import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/application/redux/actions/weather_actions.dart';
import 'package:redux_example/application/redux/model/app_state.dart';

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
              StoreProvider.of<AppState>(context).dispatch(
                FetchWeatherAction(location: _textController.text),
              );
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
