import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex_app/models/mission_model.dart';

class MissionsService {
  static const String _baseUrl = 'https://api.spacexdata.com/v3/missions';

  Future<List<Mission>> fetchMissions() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Mission.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load missions');
    }
  }
}
