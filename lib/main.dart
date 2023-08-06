import 'package:flutter/material.dart';
import 'package:plant_watch/screens/add_plant_screen.dart';
import 'package:plant_watch/screens/login_screen.dart';
import 'package:plant_watch/screens/plant_details_screen.dart';

void main() {
  runApp(PlantWatchApp());
}

class PlantWatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Watch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: Colors.green[100],
            secondary: Colors.green[300],
            primary: Colors.green[500],
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/plant_details': (context) => PlantDetailsScreen(),
        '/add_plant': (context) => AddPlantScreen(),
      },
    );
  }
}
