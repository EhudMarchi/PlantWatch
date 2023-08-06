import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPlantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Plant to Collection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select a Plant from the List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Replace this with a list of plants fetched from the API
            // You can use a ListView.builder or other widgets to show the list
          ],
        ),
      ),
    );
  }
}