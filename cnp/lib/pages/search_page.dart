import 'package:flutter/material.dart';
import 'package:cnp/widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('City'),
        ),
        body: CitySelection());
  }
}