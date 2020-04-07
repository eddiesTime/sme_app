import 'package:flutter/material.dart';
import 'package:inherited_widget/app_state_container.dart';

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
              container.fetchWeather(_textController.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
