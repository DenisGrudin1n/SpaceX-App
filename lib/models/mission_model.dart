import 'package:intl/intl.dart';

class Mission {
  final String date;
  final String time;
  final String name;
  final String location;
  final int rocketId;

  Mission({
    required this.date,
    required this.time,
    required this.name,
    required this.location,
    required this.rocketId,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    // Перевірка та парсинг дати та часу
    String formattedDate = 'Unknown Date';
    String formattedTime = 'Unknown Time';
    if (json['launch_date_local'] != null) {
      DateTime launchDateTime = DateTime.parse(json['launch_date_local']);
      formattedDate = DateFormat('MM/dd/yyyy').format(launchDateTime);
      formattedTime = DateFormat('hh:mm a').format(launchDateTime);
    }

    // Перевірка поля rocketId
    int rocketId = -1;
    if (json['rocket'] != null && json['rocket']['rocket_id'] != null) {
      rocketId = int.tryParse(json['rocket']['rocket_id']) ?? -1;
    }

    return Mission(
      date: formattedDate,
      time: formattedTime,
      name: json['mission_name'] ?? 'Unknown Mission',
      location: json['launch_site'] != null &&
              json['launch_site']['site_name_long'] != null
          ? json['launch_site']['site_name_long']
          : 'Unknown Location',
      rocketId: rocketId,
    );
  }
}
