import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacex_app/models/rocket_model.dart';

class RocketsService {
  static const String _rocketsUrl = 'https://api.spacexdata.com/v3/rockets';

  Future<List<Rocket>> fetchRockets() async {
    final response = await http.get(Uri.parse(_rocketsUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Rocket.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rockets');
    }
  }
}
