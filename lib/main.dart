import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_watch/repository/plants_repository.dart';
import 'package:plant_watch/screens/add_plant_screen.dart';
import 'package:plant_watch/screens/login_screen.dart';
import 'package:plant_watch/screens/plant_details_screen.dart';

import 'bloc/plants_bloc.dart';
import 'bloc/plants_event.dart';
import 'constants.dart';

void main() {
  runApp(PlantWatchApp());
}

class PlantWatchApp extends StatelessWidget {
  final PlantsRepository plantsRepository = PlantsRepository(apiKey: kPlantsApiKey);
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
        '/add_plant': (context) => BlocProvider(
          create: (context) => PlantsBloc(plantsRepository: plantsRepository)..add(FetchPlants()),
          child: AddPlantScreen(),
        ),
      },
    );
  }
}
