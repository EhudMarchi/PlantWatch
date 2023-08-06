import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_watch/services/trefle_client.dart';

import '../models/plant.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Watch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Plant Watch!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //TODO Handle Google Sign-in
                TrefleApiClient apiClient = TrefleApiClient();
                String plantId = '77116'; // Replace '123' with the ID of the plant you want to retrieve
                Plant currentPlant = Plant(
                  commonName: 'Monsteraaaaaaa',
                  scientificName: 'Monstera deliciosa',
                  imageUrl: 'https://example.com/image.png',
                  description:
                  'Monstera is a species of flowering plant native to tropical rainforests.', id: '123', family: '', isEdible: true, isMedicinal: false,
                );
                apiClient.getPlantById(plantId).then((plant) {
                  print('Common Name: ${plant.commonName}');
                  print('Scientific Name: ${plant.scientificName}');
                  currentPlant=plant;
                  // Print other plant properties as needed
                }).catchError((error) {
                  print('Error occurred: $error');
                });
                Navigator.pushNamed(context, '/plant_details',arguments: currentPlant);
              },
              style: ElevatedButton.styleFrom(primary: Colors.green[500]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/google_logo.png', height: 24, width: 24),
                  SizedBox(width: 10),
                  Text('Sign in with Google'),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                //TODO Handle Email Sign-in
                Navigator.pushNamed(context, '/add_plant');
                TrefleApiClient apiClient = TrefleApiClient();

                apiClient.getPlantsList().then((plantsList) {
                  for (var plant in plantsList) {
                    print(plant.commonName + ' ' + plant.id);
                  }
                }).catchError((error) {
                  print('Error occurred: $error');
                });
              },
              style: ElevatedButton.styleFrom(primary: Colors.green[300]),
              child: Text('Sign in with Email'),
            ),
          ],
        ),
      ),
    );
  }
}