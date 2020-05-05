import 'package:flutter/material.dart';

class CitySelection extends StatefulWidget {
  final Future<void> Function({@required String location}) _fetchWeather;

  const CitySelection(this._fetchWeather);
  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
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
              widget._fetchWeather(location: _textController.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
