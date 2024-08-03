import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:spacex_app/constants.dart';
import 'package:spacex_app/models/mission_model.dart';

class MissionsService {
  static const String launchesUrl = Urls.launchesUrl;
  final Logger logger = Logger();

  Future<List<Mission>> fetchMissions() async {
    final response = await http.get(Uri.parse(launchesUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      logger.d('Raw data from launches API: $data');
      return data.map((json) => Mission.fromJson(json)).toList();
    } else {
      throw Exception(Texts.missionsServiceException);
    }
  }
}
