import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plant_watch/constants.dart';

import '../models/plant.dart';

class TrefleApiClient {
  final String baseUrl = 'https://trefle.io/api/v1';

  Future<dynamic> _get(String endpoint, {Map<String, String>? parameters}) async {
    final Uri uri = Uri.parse(baseUrl + endpoint);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $kTrefleApiKey',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from Trefle API');
    }
  }

  Future<List<Plant>> getPlantsList() async {
    final String endpoint = '/plants';
    final Map<String, String> parameters = {
      // Add any query parameters you need, such as filtering or sorting options
      // For example: 'filter_not[common_name]': 'null'
    };

    final response = await _get(endpoint, parameters: parameters);

    List<Plant> plantsList = [];
    for (var plantJson in response['data']) {
      plantsList.add(Plant.fromJson(plantJson));
    }

    return plantsList;
  }

  Future<Plant> getPlantById(String plantId) async {
    final String endpoint = '/plants/$plantId';
    final response = await _get(endpoint);

    print('Response from API: $response');

    return Plant.fromJson(response['data']);
  }
}
