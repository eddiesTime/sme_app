import 'package:flutter/material.dart';
import 'package:inherited_widget/presentation/app_state_container.dart';

/// This widget build the input field which allows the user to search
/// for a location to receive its weather data.
class CitySelection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppStateContainerState container = AppStateContainer.of(context);

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
              container.fetchWeatherForLocation(location: _textController.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
