import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plant_watch/models/plant.dart';

class PlantsRepository {
  final String apiKey;
  final String baseUrl = 'https://perenual.com/api/species-list?';

  PlantsRepository({required this.apiKey});

  Future<List<Plant>> getNews() async {
    final response = await http.get(Uri.parse('$baseUrl&key=$apiKey'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> plantsJson = jsonData['data'];
      final List<Plant> plants = plantsJson.map((plantJson) => Plant.fromJson(plantJson)).toList();
      return plants;
    } else {
      throw Exception('Failed to load plants');
    }
  }


  Future<List<Plant>> searchNews(String searchTerm) async {
    final response = await http.get(Uri.parse('$baseUrl&key=$apiKey&q=$searchTerm'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> plantsJson = jsonData['data'];
      final List<Plant> plants = plantsJson.map((plantJson) => Plant.fromJson(plantJson)).toList();
      return plants;
    } else {
      throw Exception('Failed to load plants');
    }
  }
}
