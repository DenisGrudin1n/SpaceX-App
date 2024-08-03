import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:spacex_app/models/rocket_model.dart';

class RocketsService {
  static const String rocketsUrl = 'https://api.spacexdata.com/v3/rockets';
  final Logger logger = Logger();

  Future<List<Rocket>> fetchRockets() async {
    final response = await http.get(Uri.parse(rocketsUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      logger.d('Raw data from rockets API: $data');
      return data.map((json) => Rocket.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rockets');
    }
  }
}
