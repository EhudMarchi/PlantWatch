import 'package:flutter/material.dart';

import '../models/plant.dart';
import '../widgets/plant_details_card.dart';

class PlantDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO Replace this with actual plant details data

    // Retrieve the arguments passed from the previous screen
    final Plant plant = ModalRoute.of(context)!.settings.arguments as Plant;
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlantDetailsCard(plant: plant),
          ],
        ),
      ),
    );
  }
}