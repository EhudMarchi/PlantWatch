import 'package:flutter/material.dart';
import 'package:plant_watch/models/plant.dart';

class PlantDetailsCard extends StatelessWidget {
  final Plant plant;

  PlantDetailsCard({
    required this.plant
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              plant.imageUrl,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        plant.commonName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (true)//isEdible
                      Icon(Icons.restaurant, color: Colors.green),
                    if (true)//isPoisonous
                      Icon(Icons.warning, color: Colors.red),
                  ],
                ),
                SizedBox(height: 5),
                Text('Watering Frequency: average'),//wateringFrequency

                SizedBox(height: 5),

                Text('Last Watered: ${_calculateTimeSinceLastWatering()}'),//_calculateTimeSinceLastWatering()
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _calculateTimeSinceLastWatering() {
    final Duration difference = DateTime.now().difference(DateTime(2023, 8, 1));
    final int days = difference.inDays;
    if (days == 0) {
      return 'Today';
    } else if (days == 1) {
      return 'Yesterday';
    } else {
      return '$days days ago';
    }
  }
}
