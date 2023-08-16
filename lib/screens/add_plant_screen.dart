import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_watch/widgets/plant_details_card.dart';

import '../bloc/plants_bloc.dart';
import '../bloc/plants_event.dart';
import '../bloc/plants_state.dart';


class AddPlantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter News App'),
      ),
      body: BlocBuilder<PlantsBloc, PlantsState>(
        builder: (context, state) {
          if (state is PlantsLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.pinkAccent,));
          } else if (state is PlantsLoaded) {
            return Column(
              children: [
                TextField(
                  onSubmitted: (query) {
                    if(query.isNotEmpty) {
                      final newsBloc = BlocProvider.of<PlantsBloc>(context);
                      newsBloc.add(SearchPlants(query));
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Search plants...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: state.plants.map((plant) {
                        return Container(
                          width: 300, // Set an appropriate width
                          height: 400, // Set an appropriate height
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: PlantDetailsCard(plant: plant),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ),
              ],
            );
          } else if (state is PlantsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/error_image.png',height: 200, color: Colors.pinkAccent), // Replace with your error image asset
                  const SizedBox(height: 20),
                  Text(
                    state.error,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}