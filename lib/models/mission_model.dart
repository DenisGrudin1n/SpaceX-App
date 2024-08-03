import 'package:intl/intl.dart';
import 'package:spacex_app/constants.dart';
import 'package:spacex_app/models/rocket_model.dart';

class Mission {
  final String date;
  final String time;
  final String name;
  final String location;
  final Rocket rocket;
  final String url;

  Mission({
    required this.date,
    required this.time,
    required this.name,
    required this.location,
    required this.rocket,
    required this.url,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    final launchDateTime = json['launch_date_local'] != null
        ? DateTime.tryParse(json['launch_date_local']) ?? DateTime.now()
        : DateTime.now();
    final formattedDate = DateFormat('MM/dd/yyyy').format(launchDateTime);
    final formattedTime = DateFormat('hh:mm a').format(launchDateTime);

    return Mission(
      date: formattedDate,
      time: formattedTime,
      name: json['mission_name'] ?? 'Unknown Mission',
      location: json['launch_site']?['site_name_long'] ?? 'Unknown Location',
      rocket: Rocket.fromJson(json['rocket'] ?? {}),
      url: json['wikipedia'] ?? '${Urls.wikiBaseUrl}${json['mission_name']}',
    );
  }
}
